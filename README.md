# SKUtils swift

ToDo:

High priority:
- SKDatePickerTextField

Minor priority:
- ImageViewer

Bonus:
- GitHub Simple app

1. DataSource

	This folder contains files that will help you in work with UITableView, UICollectionView with NSArray or NSFetchedResultsController.
	How to use:
	 1. "Required" folder contains main files that describes abstract methods of data source, protocol for cell and data source section model.
	 2. Also you need FRCDataSource.swift and/or ArrayDataSource.swift. Depends from data source that you need to implement.
	 3. "CollectionView" and "TableView" folder contains each type of data source with default implementation.
	 
	 Additional folder "View+DataSource" contains protocols that should be implemented by UIView/UIViewController in order to use data sources.
