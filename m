Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94BF1D515B
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816972; cv=none; b=OEPvViNbnfr1i8Mp4U3QwteOVCErFzTSrG/e3Uc9oTt63yNxDocP+kR9v41YIZ4iP7UdN5da9ul66zSZppht5jC6yQZhJyRvLvFLOKUyefatetl/86lcbSLRj8hGuQkNw/cK4l1N7Iubbeaic9MGi41HxpcJpQcK6Mw/ZuVoKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816972; c=relaxed/simple;
	bh=whI28Ir8sPG5hNKF7iwI7PXvus9XuavuSyN+2+nxe6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roYKv0THbJKcz4qjL/DUI0loFHEQ2MPpmijZS+nLMkj3CtHX5+sV6cvXCrQ613ye+LyO5Rgt4bKkfM9yf3Tc/Y8QZtPiqPr1eMjDF66lrlUp09Erpj4kptl5ye9GKNHec56L2qPMZ0ov4mn9PWvdVHyy4bH+kURv02x75oKhJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGMBq6OH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGMBq6OH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730816970; x=1762352970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whI28Ir8sPG5hNKF7iwI7PXvus9XuavuSyN+2+nxe6o=;
  b=LGMBq6OHZuKyexgnZ2LopxkafQiOGU4jX6kzja5GO0XHnpUr2K1VOzYA
   Bt2u6kRfjMnZISu0BY+dNxBOwM4IfWluhIB8j5pFqRgDi368MbEf3ksks
   LUQByHV6NW5V0dgIRll/qu70RTZtPC1Qa8z+JI/UsXvKq/WHk00gSF8FM
   ovVvsNlTyhNnY75uPTJq/mT2o4V+t0tZj5/L3Owc/TtnttSo2ANvMMuT8
   jU/yVUC0R8bUmbfM5k8ohh8SZn+GaYH/1yhko6ua5mAwzms/sMQTQz9Zc
   n/TKLuXVYj8h3Grgo0vsRnAR9RI5PXiIMxNCZnsQ0xGkIQvga2hw4ad1S
   Q==;
X-CSE-ConnectionGUID: tZQ5q9xUQwCmc5/2XUva+A==
X-CSE-MsgGUID: SU5TosjTRYCy7XACpoht3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30445795"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30445795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:29:30 -0800
X-CSE-ConnectionGUID: NuYfOpNISUWSlvGw3CJDCQ==
X-CSE-MsgGUID: vSIkhzrFRv6aUhanSwd3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="87972675"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2024 06:29:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4DA4B1C4; Tue, 05 Nov 2024 16:29:26 +0200 (EET)
Date: Tue, 5 Nov 2024 16:29:26 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
Subject: Re: [PATCH v2] thunderbolt: Fix connection issue with Pluggable
 UD-4VPD dock
Message-ID: <20241105142926.GI275077@black.fi.intel.com>
References: <20241105103157.526823-1-mika.westerberg@linux.intel.com>
 <2024110542-moaning-zap-7ac2@gregkh>
 <20241105140231.GH275077@black.fi.intel.com>
 <c0fcb97d-d849-4dec-b76a-7346b1619554@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0fcb97d-d849-4dec-b76a-7346b1619554@amd.com>

On Tue, Nov 05, 2024 at 08:21:50AM -0600, Mario Limonciello wrote:
> On 11/5/2024 08:02, Mika Westerberg wrote:
> > On Tue, Nov 05, 2024 at 11:54:55AM +0100, Greg KH wrote:
> > > On Tue, Nov 05, 2024 at 12:31:57PM +0200, Mika Westerberg wrote:
> > > > Rick reported that his Pluggable USB4 dock does not work anymore after
> > > > upgrading to v6.10 kernel.
> 
> If I'm not mistaken Rick was talking about a Dell WD19TB dock which is TBT3,
> not a Pluggable USB4 dock.

It is Pluggable device but the report started with Dell WD19TB from
another reporter (they should be CC'd).

> Nonetheless I wouldn't be surprised if other docks and devices have
> problems.
> 
> We have an internal report at AMD of something similar happening with TBT3
> storage devices.  After this lands I'll ask that team that reported it to
> see if it helped them too.

I would not expect Intel device routers to fail here we have not noticed
any issues even with the commit. Pluggable has their own device router
IP (or at least not ours) and that kind of behaves differently.

> > > > It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
> > > > access polling delay") makes the device router enumeration happen later
> > > > than what might be expected by the dock (although there is no such limit
> > > > in the USB4 spec) which probably makes it assume there is something
> > > > wrong with the high-speed link and reset it. After the link is reset the
> > > > same issue happens again and again.
> > > > 
> > > > For this reason lower the sideband access delay from 5ms to 1ms. This
> > > > seems to work fine according to Rick's testing.
> > > > 
> > > > Reported-by: Rick Lahaye <rick@581238.xyz>
> > > > Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
> > > > Tested-by: Rick Lahaye <rick@581238.xyz>
> > > > Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > 
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> 
> > Thanks!
> > 
> > Applied to thunderbolt.git/fixes.
> 
> I'm a few hours late to the party, but if you update the commit message for
> my above comment feel free to add my tag too.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Sure, I'll add that thanks!
