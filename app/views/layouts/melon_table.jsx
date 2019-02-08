class MelonTable extends React.Component {
  static SkeletonRow({ size = 0 }) {
    return (
      <tr className="skeleton_row">
        {_.times(size, i => <td key={`skeleton_col_${i}`} />)}
      </tr>
    )
  }

  static EmptyRow({ emptyContent = 'empty', size = 0 }) {
    return (
      <tr className="empty_row">
        <td colSpan={size}>
          <div className="empty_content">
            {emptyContent}
          </div>
        </td>
      </tr>
    )
  }

  render() {
    const { SkeletonRow, EmptyRow } = this.constructor
    const {
      columnsSize,
      skeleton,
      skeletonSize,
      empty,
      emptyContent,
      header,
      children,
      footer,
      className = 'round_box_table',
      ...otherProps
    } = this.props
    return (
      <table className={className} {...otherProps}>
        {!!header && <thead>{header}</thead>}
        <tbody>
          {skeleton && _.times(skeletonSize, i => (
            <SkeletonRow key={`skeleton-${i}`} size={columnsSize} />
          ))}
          {!skeleton && empty && (
            <EmptyRow size={columnsSize} emptyContent={emptyContent} />
          )}
          {!skeleton && !empty && children}
        </tbody>
        {!!footer && <tfoot>{footer}</tfoot>}
      </table>
    )
  }
}

MelonTable.propTypes = {
  columnsSize: PropTypes.number.isRequired,
  skeleton: PropTypes.bool,
  skeletonSize: PropTypes.number,
  empty: PropTypes.bool,
  emptyContent: PropTypes.node,
  header: PropTypes.node,
  children: PropTypes.node.isRequired,
  footer: PropTypes.node,
}

MelonTable.defaultProps = {
  skeleton: false,
  skeletonSize: 3,
  empty: false,
  emptyContent: 'empty',
  header: undefined,
  footer: undefined,
}
