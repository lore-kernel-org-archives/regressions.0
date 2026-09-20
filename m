Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913521A0B15
	for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 02:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789869837; cv=none; b=Yw0Wume+oqC7t4WmBDMtVGh+M3VNevhbQky2KN7AbgN/y7VkPFPYssusSQal8ukqRfxX1ACApJWmj1KuUo6eEJWC0bqadNWX6l98KiV3nLmHyPgUjDn/dFbUAm4EdDzgQOoOK4MGUGxEoaGes36RRUdpTMC0WK8eM0tkbMH7qBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789869837; c=relaxed/simple;
	bh=b4N+XawsZW/9NJUYjuLvRt6+7kazXDkmH5hfSMdqLXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGTwSl4oGQf7LTAAGMSKyNLsGNKXHwvsBFhd/vaGa9OBlq7QNjTpS9sFccragR4UIhytJHcdsyajBbybetccd2wlqbgvpCsZwE8tq6TXA9ctQhf3ztyTOZIIcxz47QU3ioe6lbVQra0HtmFq9NmNAc6bCHvAs3dx4Y4BS9Albis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifb7IUsK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifb7IUsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789869836; x=1821405836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b4N+XawsZW/9NJUYjuLvRt6+7kazXDkmH5hfSMdqLXk=;
  b=ifb7IUsK44fHIQxIGVqPLJD7ACPxpid20SPYL73XpCxDua0KydwzrwMo
   wlOUVioH96ibxrWaQIVR7BlcOty7J70eQEj3LqghuMI0TzoWZ6Rvjxdqe
   znqGo8XDG+fsUwVLGfGJvkmuVVxJqHJIRMG8tFjOp1EZJkd1WS7A6UMSO
   4ZbmCQ1UpwoJtat7oZ4IWgVuYVETfaF8RuliFwt+amvhzKIzeC3XK6clH
   d7AIHNWav0lNT5B3d27aNiGJrC26+67K/+Pm4SjBPbDd+pwVTP3hRUVDb
   +vuvod+YGxsl/HN+7VCv+2P6pevzTALfryDQYjrQKE73Y8WrwMCy54g6U
   A==;
X-CSE-ConnectionGUID: eRJwTUAeRUyW/Us3OnTMjg==
X-CSE-MsgGUID: Ue0IednzQI6mI8GCLB0fcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="90509616"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="90509616"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 19:03:56 -0700
X-CSE-ConnectionGUID: vOcWsVdZRtqZ0ep9Crlp1g==
X-CSE-MsgGUID: dC1ImFLwRw2FVhs9YtcaBg==
X-ExtLoop1: 1
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 19:03:53 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] =?UTF-8?q?media:=20Don't=20hide=20I=C2=B2C=20or=20SPI?= =?UTF-8?q?=20drivers=20by=20default?=
Date: Sun, 20 Sep 2026 10:03:47 +0800
Message-ID: <20260920020347.709849-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <598cd300-dbec-44fc-a670-f575310e6a43@leemhuis.info>
References: <598cd300-dbec-44fc-a670-f575310e6a43@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 19, 2026 at 09:10:18AM +0200, Thorsten Leemhuis wrote:
> Also wondering if the "olddefconfig" case on Arch was tested to ensure
> we prevent more people running into problems that Junjie's fix linked to

Ran it: this patch on its base-commit, Arch's
config.x86_64 (7.2.4.arch1):

  olddefconfig, before: no VIDEO_INTEL_CVS line
  olddefconfig, after:  # CONFIG_VIDEO_INTEL_CVS is not set

The option has no default, so olddefconfig leaves it
off. With the patch, oldconfig prompts for it as (NEW)
and listnewconfig lists it.
