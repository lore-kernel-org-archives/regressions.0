Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A3CA6B
	for <regressions@lists.linux.dev>; Sat,  4 Oct 2025 00:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759537916; cv=none; b=M6IfIOqxuFp4xYLMKaIQM4L4OmoAYXxD3YG1wqdUkA/88bq2hja7XmtO5212eolAwwPI+AkpEhn/1HVNhcB3SdDZK2nLOfx3/1o85LkgvhlnY7b0VsAD5ro4xhXUwtRm9xGymAVM6FnUJcV/P3JASLktmqlO8ieyUfk8eZoc6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759537916; c=relaxed/simple;
	bh=fLCm2GBp5HRL6zxysxEr4pDI57fJyTlWsY3Wgv//eJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHjBobD659vhbBDbNUAShlJPAK1qeCoKILEH3k8cpcVhYC3KnTuNPyaM/TfYS0YShrtxkWwmlsHoiR6XHJtQR/4nljJuZxBkFB/w3cJ7aSU2LUYbJB0n25IpXUiT6fZGpMeQceqHZ8iLNBIDsaIwqselahPpWoqnzardixDNBFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=a08gbaF3; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="a08gbaF3"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-86be8a110f5so30176666d6.3
        for <regressions@lists.linux.dev>; Fri, 03 Oct 2025 17:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1759537914; x=1760142714; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Hve5D5bXNWxh8nAKCs1hmgTLg+XAURZWqKyON8mhFU=;
        b=a08gbaF3RKSEtKiIkTh7926mc+Y1oRVVaiskY3mIyl2s4HN28UbtS4l8fBI2lhF4qr
         mzutPC/dQYZ9LbKbWz02xrKltjGlKImVfFNc3Kw7vhkUJQDzhVhtOJvwJx+mLwrmNCKj
         nL63JYC1wmM5Qb5bEBxDYSmcCY9HpYqF4xXiB8P1H9WwAIXvAps/6KZNXt2ij5+09d1A
         sg8zwhmL/XSIf4X682BDwXgCoiJOK8dUYqU9LWYpYLR/i4jN07TsG+OKF4MrYvqw19pm
         JxXuSVlkpR/MnD6/l5Q8SooMaM3KLZ6t9RlaWmmgkVGqUvfN+kzvzxSxG25QVG1CFw+S
         Mq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759537914; x=1760142714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Hve5D5bXNWxh8nAKCs1hmgTLg+XAURZWqKyON8mhFU=;
        b=WUyf1tYQBN+j2x9PnOj7+s0HWS4+KcqkaS2kl8/O+B631ztwoKGPqh6DvP8zWm7AYS
         U3Isjt3vDzWxeuGRP+CBl19WHtgkHa0+GpBsiqQLAG9Vf84tQx+I96zDWDAftkhIKQcZ
         BUl//+uPA138Akl2HeFDbI4/5UHPpajkUpZsW+pzqNOIVzvZbLqGjnnmkQVo9FGEJSjx
         r9yWTKee4Qe7V8JdfEZ4VlSqE1xVbrU8nKcBzpL1e9sauYaPhRTIBvfzgpFlx05WvvZQ
         ALP75EfIhuV42Yj+4hMvGTlnTV+7Fq1L7B/ND6xepK26A1kgI/Tf4d8X1F5SMtLBsjnO
         8dRg==
X-Forwarded-Encrypted: i=1; AJvYcCUhA5Zyk0RZ1aOja1yCldSxVvfXiUdqYzglnHr1eWh6l4uO9rD+2vscLfCausatBRoYH7IdJyrmdUtM1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1pCa9uX/npB7mXBNWVE4O1/OcxVuoJVTreoTDr3SjollsdKsh
	EYYf3ijSo9RSotyROB2R0kNmBZL+R3Z9Ev41StGlXhWKTG4bdkzdlXFAWA6VcjXcCQo=
X-Gm-Gg: ASbGncvoY6CHyZx+3ezLI6mMCiN5EfAaygzEFA9MW+tGCkqgVOcymUFnS6V0VF7bQCS
	b840AcvLuNUW7VRmiI4adHHeulEvHpbW9TeRDHAGdZArXYh7s6d07NhvPtErfcD4I0rjQJddHMA
	ZMUhwb1QOgi4oSlxmVDBPh5rTVWSaMu9HnUn0WU7tBtxbcRXAlsTbpd5Z5/GNgOxc7cRw2ATw4a
	EuMWGv1rtfuv03rme2CXrofezoC44lrsw3TWm1brYaXrS3rMH4d+mnKtxcLXa1kUftVc4fe5nJh
	H4sVcAGv0Oh9VpOMwcOeE10srNhvR+tTORc3pqUk0Pml9eZYGYZhg6Q5CGNAMYxchLe+GPMKT8e
	AQ9R3pj4OClffGUC4F0dvwnnOOPX5Us5AnNRbaBo4ic9e0ngw3lv768RnUQTLo+rKcRcffiYW6P
	DW7OQZFY87GfE=
X-Google-Smtp-Source: AGHT+IEsRjI8gCuEno0aPQByvaMn1RbhQu1LEY6DoWqtshtx58svm3JOMSvxRR1frC8lP1Smp+Sc7Q==
X-Received: by 2002:ad4:5ae3:0:b0:820:a83:eaed with SMTP id 6a1803df08f44-879dc79b792mr57956596d6.24.1759537913717;
        Fri, 03 Oct 2025 17:31:53 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-878bb53e3f8sm51778496d6.26.2025.10.03.17.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 17:31:52 -0700 (PDT)
Date: Fri, 3 Oct 2025 20:31:51 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <qjyncqymjja57h2wxxv3ebuqpip5qu7yjalccons5xmtzfw5h5@m3u4rvbqzcxt>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
 <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
 <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
 <f1de37ae-2ae4-4513-98fd-18617016704a@suse.de>
 <5949fd73-3ca4-4bd9-8092-2d9923dcbfd3@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5949fd73-3ca4-4bd9-8092-2d9923dcbfd3@suse.de>

On Wed, Oct 01, 2025 at 09:26:28AM +0200, Thomas Zimmermann wrote:
> Am 18.09.25 um 13:17 schrieb Thomas Zimmermann:
> > Am 18.09.25 um 04:04 schrieb Nick Bowler:
> > > On Wed, Sep 17, 2025 at 11:14:45AM -0400, Nick Bowler wrote:
> > > > On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
> > > > > The ast driver doesn't do much during shutdown. Could you
> > > > > please out-comment the lines at either [2] xor [3] and report
> > > > > on either effect?
[...]
> > > > > [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
> > > > > [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839
[...]
> > >    - Deleting [3] (only) appears sufficient to make things work again,
> > >      that is, deleting the following line in ast_mode.c:
> > > 
> > >        ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
> > 
> > Please test if the attached patch fixes the problem for you.
> 
> Have you been able to test the patch?

In the normal scenario where everything is working and I reboot, then
the display remains on for the firmware (this would seem to be an
improvement).

But it introduces a new problem: the screen no longer turns back on if
I boot the patched kernel from the "display off" state.  The unpatched
6.17 kernel would at least turn the display back on from this.
Furthermore, rebooting from this state keeps the display off.

The earlier change [3] above has no such problems.

Thanks,
  Nick
