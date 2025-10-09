Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C119EED3
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760054168; cv=none; b=n/EiKMRlzqFwW24+zg5pk2ltgfkwF29eFvIZ43e8vefECn0BOyiPav9eqaP49mTnBYKfwk9tfcW8LJPtfGN1Q65tCF5VUdJp+w6mvmO2l6ZrjVle5+r7/wrWY2NlFNbJOf7/Kkd8dV8XkDm3rrPpDcI/0jMHRjY+z0hVKRt6pAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760054168; c=relaxed/simple;
	bh=RDNvFhXMLtxlMPAmEwgJ5B25rN9h8pzeMm/QC1MG2K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUOKHB1gd5OdAl3bqxrvBxYzHS61eizQLg/7jHRndGbhOxFbtsdMqCBihO7D4fo5tv7t0df4TuKnHfKrzPkZB0TYfI11zQYE+wZaAj4eyzl+JNcOMg5AeYZeHqmqTMkwBiChbb5XmM9l+pPs7dq1f2WzUt01uM9rcoClFMRpcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=VPGisGqB; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="VPGisGqB"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-795be3a3644so9567026d6.0
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 16:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1760054165; x=1760658965; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bTFpCR/KI1F13hy7CFFNjYUFOgplKs84/KujihK2OhQ=;
        b=VPGisGqBjLanfUtNkpt2e3z4Q8eDN+4KKa04od9WJJNpvYPx4bs+reikXHg8Pr8tgT
         TttpCmO1gw8DQfqEvLVq28UbAYG7TBxO8drQM/ndEQix09GvoeWds58Eh4U7fooMaqor
         sv6QlWIi9J/QthZaJh5V2WRfQyUkjIzv6PpU6WNlraP+JGGEDowXXiGr6bHdcfIUSSRg
         jO+h1DAJtgE53G5JLS76FXN1iEhr+mE5qNU5eohCPSVI/sENjv2hZudbM6hq5gCE+EhE
         yIJFUWyWm0xMcS3O1Q+sDV/5vQWhhc0uxDi7d4AXATQiPC2rd+ygGUj+xhV1HfiW9G+q
         FyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760054165; x=1760658965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTFpCR/KI1F13hy7CFFNjYUFOgplKs84/KujihK2OhQ=;
        b=dEjsOUUHkDFIkeaucwYzV9ACorW+nNZlkY2UP1TYldC3bHKb+ry2Kr0w0G46ha7IIZ
         MT3bOYKOuUmbn8EMF8plgIUOklG1bzE7q7Itbc9P4Rtx6NL1MPZ0gXkmuMjHifM01svX
         K1oy+wgkOkKparaVDAmqbpOY0V9ywIK49FgLxxAMlBjbFTEKZ8FjH+NbFKoSnavb4rbc
         59EqPjDLprCx3Pq8453Ll1XtrVT5Pi6u4gvD0rxnDVcHdAsEKe5i6HVpw8gD/73KzUp6
         CMBwzp+QpY9dCBzuSelk7mGYPtoKmTw4zQ70HY/aK5WWZpzZGIr3A8mfFHUWuJvTAdnE
         Jb8g==
X-Forwarded-Encrypted: i=1; AJvYcCWV8nlA03losgF4IQMbCl9/zUSKE8Vd9QVhUhWMOJZzBtxMaUqBNc97sGO8ShodApLIjOE5lAy/B88jOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy76IR250J0Fbyhqslj1Y8QMMrs/jpWald5yTKzGNMNXXUulzZP
	jHn/sIOtUvewpOsGBMVTCgcZidP4JahFSuRkmR2bg38l8c+/HNLOoOQsBf8OGEhyoXY=
X-Gm-Gg: ASbGncvZtHmy9JF/LTVdWHT08OkuaA/bP642iPtXeAthq6F/7SyjGSaM9jH+3gEmQM8
	1Pnj5FWOE4DGm/Ooi9TkB7oFcBaVjKtI+VeNJRRED4qbxn/+ZNkbtzz+zwttIkCJds7qlSFJN8k
	74NCcHVRR46snbR5AseS9J5OfVcXLg+Q+sKm/mmqdEybj0hHKfJXNLTxSk3Uebb4cs/AWHqJHq1
	ldCKQxGUez1PwQTbjYVuzgoSSNjqQQ6cN2ToJWKHHZ3Ii6NAYb6LFxxZQMnI1FBbUQQVEyL+qgu
	Y9pGLRlpuLlGBbMUjV+MEyd+hCNwNrHqoDH7ElXytMdURrDwCHomu8ZT8wUKv2GWJ39ezQnwZLD
	T+tKqByUSX0BMcnqyYfgt/A/1kyYfTYEq89KwqO9ss+/lyc6DpkC8BbttitkubosKVLL8K+qlpt
	6I
X-Google-Smtp-Source: AGHT+IH6Ltx5J9UQ1h01zMMBVoitoSRQwM7F5bZvt3pvVezHa8vMsYH7ROgPUCpj3UYMdCE/cK73yw==
X-Received: by 2002:a05:6214:f23:b0:80f:abfe:819b with SMTP id 6a1803df08f44-87b2102679amr124997606d6.26.1760054165314;
        Thu, 09 Oct 2025 16:56:05 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4e706b97ba7sm7574841cf.4.2025.10.09.16.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 16:56:04 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:56:03 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <hyyyuqsyf7c3ed2ku57fp4sjwkpcacygtrwnkgupn2xdq7ez4u@sg6xeg4shkdd>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
 <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
 <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
 <f1de37ae-2ae4-4513-98fd-18617016704a@suse.de>
 <5949fd73-3ca4-4bd9-8092-2d9923dcbfd3@suse.de>
 <qjyncqymjja57h2wxxv3ebuqpip5qu7yjalccons5xmtzfw5h5@m3u4rvbqzcxt>
 <e0104f10-9230-41e5-acd1-4ca95c38220e@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0104f10-9230-41e5-acd1-4ca95c38220e@suse.de>

Hello,

On Tue, Oct 07, 2025 at 10:51:29AM +0200, Thomas Zimmermann wrote:
> Am 04.10.25 um 02:31 schrieb Nick Bowler:
> > But it introduces a new problem: the screen no longer turns back on if
> > I boot the patched kernel from the "display off" state.  The unpatched
> > 6.17 kernel would at least turn the display back on from this.
> > Furthermore, rebooting from this state keeps the display off.
[...]
> Thanks again for testing. Looks like your BMC is especially picky about
> these settings. :)
> 
> Attached are two patches; each trying to eliminate one of the possible
> causes. Could you please test them individually and report the results?

0001-ast-Use-VGACR17-sync-enable-and-VGACRB6-sync-off.patch
  ^ Everything appears to work fine with this patch applied on
    top of 6.17.

0001-ast-Use-VGACR17-sync-enable-and-VGASR01-screen-disab.patch
  ^ This one has the same problem as the last patch: the screen
    does not turn back on if it was previously off during bootup.

Thanks,
  Nick
