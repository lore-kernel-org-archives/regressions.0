Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565EB3C945B
	for <regressions@lists.linux.dev>; Thu,  9 Jul 2026 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783579285; cv=none; b=bUeDSl5z6pAzm2XQNde5wdK76Vg9yxkW7HlMGTxEfRKYCHn2MoI0AJykGMWZ4N//fCKFNI8FfCgb6eZdvTNPF5n8U9UT5We4FZFCVdZbFX2ElbpqGsFcdZgB4HbFe/YzCWcXKjO/OSFdl2MlgM07IvFP1KRGnRDSRfP5s2v0uB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783579285; c=relaxed/simple;
	bh=E//VE4g9qB8ghHcysXcxEO34NhH/K1Yn1mgn7Alx6tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxVbCl2cjWcwaYbavpvt6AKoQ1NOTCNVFpIBGfgFtLqEBy5yDGAHQNHF8nuoZyXu/twhqeNx6YxOiNXVCwBKpF3G/wIiXR0igwjGn3myCAvaGGE4Acq07f7GQZFxU5MwdN7HN3rgcAX7C+rOlOEbXPHurtPzolDrSNkp/sHnZ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zz4IvY8z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zz4IvY8z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A6F1F000E9;
	Thu,  9 Jul 2026 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783579283;
	bh=jyw4o8wwp2zbGxJocUmZcA8SndK/k2VRRodpzCeLrDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zz4IvY8zyvLue0BR0/w+fHG9mgWgkdrIcLF3TkL/+QeWXvIHCfXSSIE7rNvMKWizm
	 jKBgD2acB3Lqjb0H/cmjHKxRtpc4aqTPWtnbY5VL9ofXUWgiwRCviNiTKChnjSpJer
	 8C1t5fWt53g+pcqq6+N3Bjj8t4YuvevQqxNMK9x4=
Date: Thu, 9 Jul 2026 08:40:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Papool Chaudhari <Papool@chaudharilaw.com>
Cc: regressions@lists.linux.dev
Subject: Re: [REGRESSION] 2017 =?utf-8?Q?Pixelbook_?=
 =?utf-8?Q?backlight_control_doesn=E2=80=99t?= work with 7.1 kernel
Message-ID: <2026070936-geologist-yapping-31f4@gregkh>
References: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>

On Wed, Jul 08, 2026 at 02:58:10PM -0600, Papool Chaudhari wrote:
> 3.) With 7.1 kernel or higher, this fix does not work, neither do any
> other known fixes for controlling backlight.

Can you use 'git bisect' to find the offending commit?  Odds are it's a
graphics driver change somewhere...

thanks,

greg k-h
