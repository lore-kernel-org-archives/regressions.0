Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A6158DD4;
	Sat,  4 Jan 2025 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735978512; cv=none; b=CCp1i5/9yhDSIk5er27C2VGupfiF6Qc2mgoqVfn69xEy5OGaIHfmzDN0N6AP1rfUBfDuMgRmN00Xhpmh2QeXJXGhqc4sJYkV2SWjz2NDOKuRgSp3GcFBOtSs21dl5iRfe6IhusqX/fUesEuYfjVhVidxua0gpnbOTY9fbwxzDfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735978512; c=relaxed/simple;
	bh=P1sp3Mxe90WkjBHTFK9fi2Ed9T0AknrV10tLGfzGmrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7wvndMhh1Hn2TMYjlsblK7OgizQy9ZLULHGGcgiGr7eNnLQDozVFR0ggwmFNyASqrL3Kd25ygI5maifopUfrppozTElULWxgee0KZzf9PJGK+fohEG8ISjBvuHjQAMSSpsIg1Iti9TEnkup9B7rjehCG+M7IWOFIvEveyg2fME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZKzbV3CT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZKzbV3CT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FCEC4CED1;
	Sat,  4 Jan 2025 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735978512;
	bh=P1sp3Mxe90WkjBHTFK9fi2Ed9T0AknrV10tLGfzGmrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKzbV3CT4p42HLh56iRmyJaIjTjRGru3gTlGbEbRQDDX6TOwV0KWut0kAovLFhlHh
	 KvX8hxg0hzShabzNUdf3O5vByR5brGZpyFqMUCwj3cG4PsLFgNXcxFxtX8Vx+4Ie/t
	 2Kj9BolYvu8JZC2/MY3f5TeFDG3LACilelzMtw3M=
Date: Sat, 4 Jan 2025 09:14:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "zhangzekun (A)" <zhangzekun11@huawei.com>
Cc: dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev,
	tj@kernel.org, alex.williamson@redhat.com, chenjun102@huawei.com
Subject: Re: Possible hungtask issue will be introduced with device_lock() in
 uevent_show()
Message-ID: <2025010443-blighted-monogamy-f125@gregkh>
References: <172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com>
 <20241231075608.84009-1-zhangzekun11@huawei.com>
 <2024123128-monetize-outtakes-3260@gregkh>
 <7b599394-d1a1-4e13-9c5c-48321172ec65@huawei.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b599394-d1a1-4e13-9c5c-48321172ec65@huawei.com>

On Sat, Jan 04, 2025 at 02:02:54PM +0800, zhangzekun (A) wrote:
> 
> 
> 在 2024/12/31 16:26, Greg KH 写道:
> > On Tue, Dec 31, 2024 at 03:56:08PM +0800, Zhang Zekun wrote:
> > > Hi, Dan, Greg,
> > > 
> > > We have found a potential tungtask issue has been introduce by commit 9a71892cbcdb ("Revert "driver core: Fix uevent_show() vs driver detach race""), which revert the rcu in device_uevent but reintroduce the device_lock() in uevent_show(). The reproduce procedure is quite simple:
> > 
> > The revert just puts the original logic back in place, so this is not
> > anything new that has been introduced, right?  It's just that the
> > attempted fix didn't work, so a different fix needs to happen.
> Hi, Greg,
> 
> Yes, there is nothing new introduced here. We have been testing the rcu fix
> (commit 15fffc6a5624 ("driver core: Fix uevent_show() vs driver detach
> race")) for monthes but has not obersved problems.

That's great, but other people did report problems, which can't be
ignored.

> Noticing that, brmails+k write in bugzilla "Also, I can't say why the issue
> appeared in the past even without this commit being present, as I haven't
> bisected any kernel version before v6.6.45.". I doubt that there could still
> have problem described in bugzilla [1] even if commit c0a40097f0bc
> ("drivers: core: synchronize really_probe() and dev_uevent()") has been
> reverted, and the problem is not directly introduced by rcu in dev_uevent.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219244

So you think that the bug report is wrong?  Ok, then you might need to
take the time to prove it :)

If you feel this should be added back, please feel free to resubmit it
with the new information as to why it should be ok now to apply it.

thanks,

greg k-h
