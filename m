Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456BA20
	for <regressions@lists.linux.dev>; Mon, 18 Jul 2022 03:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658113267; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fxO/d+bxswlbxRus4Vt0+P0BauVizFFQ1lH22yUZYEomLWPl7SW+z4G8u6T/swfQgXBX4GPIedbt+IzO/Y0cgz7uhvK3azAN2PruqKSwD+0Q0KDrnWK13M/c6vEihWxU8mfw7FR/LXzEd5pHutA7bBMa8JB2YcRq6E0nnqFExP0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658113267; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=fSiw/c0YLP5eX+eUTAjsy80YhkRWRCcIPfCXhb78j38=; 
	b=WxAwE8tmRcVlalIa/Y7Nxn93Esm1IW7dpBOOMGb6ZmNBQHyBMd4UIBZoGEJ4XoSBxcGji/xRKJRNfNkr/LSM0jkLzIkRLrNn+4NCDkea71dshkrVxYerTkBiQaqP33fVHi3gODzSZjc2SRoMa6vwxbyx62dpKukoB+HexCWKln4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=paul.a.thompson@zohomail.com;
	dmarc=pass header.from=<paul.a.thompson@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658113267;
	s=zm2022; d=zohomail.com; i=paul.a.thompson@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=fSiw/c0YLP5eX+eUTAjsy80YhkRWRCcIPfCXhb78j38=;
	b=AQUc9+JXGwSI/wtFd4tVH2EpaCKy4cn0PoJbrJfq1+xK8FWz6V66zJ+2/ZBnHxLF
	FT7MWiVZCDClIXq8871u5KS+Tp9CP64ZmE29GDuxlKeKBYaKK7GbYccIy1/g/vxQuHl
	Lti+j2tdgLHcpBiUgA0hKdCzCposcg+yEvnAnjS0=
Received: from squish.no-ip.biz (212.102.58.175 [212.102.58.175]) by mx.zohomail.com
	with SMTPS id 1658113265836242.6203362347577; Sun, 17 Jul 2022 20:01:05 -0700 (PDT)
Received: by squish.no-ip.biz (Postfix, from userid 1000)
	id 6367C6509; Sun, 17 Jul 2022 23:01:04 -0400 (EDT)
Date: Sun, 17 Jul 2022 23:01:04 -0400
From: Paul Thompson <paul.a.thompson@zohomail.com>
To: regressions@lists.linux.dev
Cc: amir73il@gmail.com, torvalds@linux-foundation.org,
	gregkh@linuxfoundation.org
Subject: [REGRESSION] recent changes to copy_file_range behavior breakage
Message-ID: <YtTM8GYn0/HkSoet@squish.home.loc>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ZohoMailClient: External

	Something that worked in 5.18.9 no longer does in 5.18.1[01] and 5.19-rc6.

	Using the example code in the man page for copy_file_range:

# ./copy-file-range testfile-on-ext4 /path-to-another-ext4/testfile (or symlink thereto)

Works in 5.18.9, fails with:

# copy_file_range: Invalid cross-device link

And produces garbage file at destination on newer (5.18.10+) kernels.

	This breaks eg. qbittorrent (moving a distro image across ext4
filesystems, or following such a symlink) So potentially other real world
applications. I do not know if the reason for the commit overrides this
breakage, but it caused me a bit of a headache.

Thanks;
Paul

This commit:

commit b9cabd2ec2ff6f452bd5744326cc5c5f503448c6
Author: Amir Goldstein <amir73il@gmail.com>
Date:   Thu Jun 30 22:58:49 2022 +0300

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

