Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A96825B090
	for <regressions@lists.linux.dev>; Sun, 12 Jul 2026 05:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783835481; cv=none; b=ssCXKhTk5UJLR+XhkMS9nmb65VFgCnPWE/cXnZWZPLk4D4dlsqh81dXbnaCAk9oCZhGwLXUdGJD7jIe3jbZYeM6q3//6TWZFoUfcmNcv1n5nsKIdT2Dan+9sOj/h1SHTb4HtwyBGcIXaMzKeDMJ56RWDZoSGJ2OPy8HSEROYXFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783835481; c=relaxed/simple;
	bh=Kd3iUUQiQYQVLJSJkDfMEw2drjYQxw/4U8gsZpBBaFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcfTKDEB+rszj2qZGI6lUVkvRBc7kn321/t33CtotgAX9i5j3PQa20ByUYHYsbeCjTPJihW2ywgW8yUek13VN9+pqH1ov+D7FfG1G3jN+vktGTAfro71mtqgzcxQWTHXkBcmDTgkPJ0KxyEQjRgiXRuv4mBk5kiAmQFKGBnml20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DBBa+Lsc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DBBa+Lsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FBB1F000E9;
	Sun, 12 Jul 2026 05:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783835479;
	bh=pkWiXxZHaEVBDmY4pOxHMNObxU7TSS+xlclKE+bKBkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DBBa+Lsc3CVKWSvw3OsbIXAmdmnORHuOj0SQVDrcmlkjnOwLd+6rDTNwBF0IovVTJ
	 8i80x0RcudOvJ9AUYDDV/zreeOCOMYk827XPp/nVYjsBRka27nnRwg4ivsrWjUOu3u
	 MjUGRM8gnFsshN2A7o1V+CGE6B8b83zKVMzzAT84=
Date: Sun, 12 Jul 2026 07:50:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Papool Chaudhari <Papool@chaudharilaw.com>
Cc: regressions@lists.linux.dev
Subject: Re: [REGRESSION] 2017 =?utf-8?Q?Pixelbook_?=
 =?utf-8?Q?backlight_control_doesn=E2=80=99t?= work with 7.1 kernel
Message-ID: <2026071254-resort-supervise-7d28@gregkh>
References: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
 <2026070936-geologist-yapping-31f4@gregkh>
 <CALcz8n6VtL5D20WCJEsiBRDRKOE6GsF+YPCc+XuS2xr-mqnSTg@mail.gmail.com>
 <2026071109-armchair-civil-7b62@gregkh>
 <CALcz8n4XCt8GK0X=JTDOkMn32Z73HpHKRNaRCdSf=mzr3+r27A@mail.gmail.com>
 <2026071153-wrench-operating-e32d@gregkh>
 <CALcz8n7XoEvYK7PM+WWuQ2rBaWujc3YTQh1DWvLxoRHt3bAT9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALcz8n7XoEvYK7PM+WWuQ2rBaWujc3YTQh1DWvLxoRHt3bAT9A@mail.gmail.com>

On Sat, Jul 11, 2026 at 12:38:02PM -0600, Papool Chaudhari wrote:
> I tested both parent commits of the merge
> b3793af3277f65d256d67f9949e760b434ff66dd on my 2017 i5 Pixelbook (Eve)
> as requested, and unfortunately, neither side is bootable:
> 
> Side A (51cc1c427461): Fails to boot. Completely hangs early at
> "Loading initial ram disk".
> 
> Side B (88919bedabb8): Fails to boot. Hangs at the exact same early
> "Loading initial ram disk" stage.

That sounds like a different issue than the backlight, right?

Why not disable the ramdisk entirely for doing kernel build testing like
this?  It's not normally required unless you have some encrypted
partitions/disks.

thanks,

greg k-h
