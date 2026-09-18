Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83AA39733E;
	Fri, 18 Sep 2026 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714950; cv=none; b=KX52zBGs9Vsmq3HTkDHZVuiGrkNNfYYgADJDUZqiGdbDBApJgPRKaXcYKvqv6UIM0RkkldLfXd8jhSFyqb7pN89w6QRQzMoUC8yKVLz7J5U2RpCz2MHJwvoCLFSLYbXHTVBmhWdzTEhSDfq7swPEekB9BDfiNE7A6rEWF5FH8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714950; c=relaxed/simple;
	bh=Ab57gbCozA0XCg2TAtvkerpNt0WPhCOtEoULJllt0vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heqhLwoMKhxA3C/iXZZIU53XArYTBGlA5zroF3ebV5Gm/Oza2rqL1N9T/Ddzwe/PPY5uTrZk5ZjSKFpNtgnOIOiL7X8Q89LHMLt5cR/mwH/eV2iO7Q3MRqLA7bSdTYWNouhVJ/IZhahsP7uMMCT9Zcotyr+UBV2ttwjuzX7QFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO3I+MCs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO3I+MCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789714946; x=1821250946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ab57gbCozA0XCg2TAtvkerpNt0WPhCOtEoULJllt0vQ=;
  b=HO3I+MCsD9yCe3xADYPc0H+QlSbaAwKC3NaS6EWQ8mjt042C/2F0gpm6
   pejZUngKgwpFd6iT7KJMsmZBYhC24gax544MSFPo/4PDexLXQrI5qF/0c
   307TwWNecgtAdvGxEbb7xBQNgHZeRVqmC6eDFVQ5GfKY1tW4E/4qSLqcO
   WIzYBUHplKHNJbVPIjKVa8co/teYMvLJ0De7xpK1cnK/bDpwtTVhaC/Am
   ardZ4r/liPxF1jQyTQz4d0qUrCjek39jbeCupNcXmV9tK2HhrcP9DteJj
   K8+5r5sT5cnSE2BKZsqs+wwgyB0rUvJ3KBZgW0dJINV7LhhE4HTXhlr11
   w==;
X-CSE-ConnectionGUID: PCecbUBaTlCnf5+98oAaGg==
X-CSE-MsgGUID: m4JJGBuyS/CBlfGGlspPAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89336566"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89336566"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:02:23 -0700
X-CSE-ConnectionGUID: bJAezRZrSSiXc334p5QXXw==
X-CSE-MsgGUID: iOs0djwWSw64jUA+bjHBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271582529"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:02:19 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: i2c: cvs: Do not hide the option in the ancillary menu
Date: Fri, 18 Sep 2026 15:01:49 +0800
Message-ID: <20260918070149.688376-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aqvTlNnMw4FRqom_@kekkonen.localdomain>
References: <aqvTlNnMw4FRqom_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 17, 2026 at 02:48:36PM +0300, Sakari Ailus wrote:
> I'll post a patch for this.

Sounds good, I'll drop this one. Thanks.
