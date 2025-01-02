Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429AD299
	for <regressions@lists.linux.dev>; Thu,  2 Jan 2025 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735791522; cv=none; b=sJbj3MqLzQIAv+AXGsZhPSY1uFpYYFOwjQYOkVwqxcIzit3p4SbkewfgfmLgR254ibDo+8nVOWDUM+LpszBRp6Hj1vVLAnluEUUBkWQjVrJ0wpPeDQqFYUcrZgcIcHgnti26HSefGnw3JwMggoNuzBhYgYF2IE9whL9NFNUkh0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735791522; c=relaxed/simple;
	bh=5Hgcp/rOQr79VmKLIg0j8jrldXJiZHkHt4iM1asDAr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=r36BD+Ff8tFvuy1WdvYPTb47UTRKETCIxW3frDx3SlQkmjqay84B/1DJjs8MlCka91Tsx45h8/wIfwUwB4LIyMuk8DHOVlxn1jnq11A1s9Kdi2z1LWFz9AuDXDwQMNnSn+JJJc4nCRFmKYNjCO0Vj82YY7alqhqfHwLimX/hJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiBZEZNn; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiBZEZNn"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4677fcf112aso10193911cf.2
        for <regressions@lists.linux.dev>; Wed, 01 Jan 2025 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735791519; x=1736396319; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Hgcp/rOQr79VmKLIg0j8jrldXJiZHkHt4iM1asDAr8=;
        b=TiBZEZNn1l0GSTb3wB/ouwZLuwinqIw/yEBID8l24Vw0E2GNAHH4pez2juixwKcnfh
         xj0PnaG6deGWysD7VLlEBVd34HCCDVQ9Rl3HFdErSsvh8gl+QDKk0ifXuoI7zadjY5wW
         pG13g60+U5pY9lsd467jdg5mKhhYvvDdZug+VMgwHdT1yUGR7cTm3lCr+yz+HKLlaL27
         WoPCUpXIBOVYAN+ISuuvCvFSYlOnTqhC34NVnKU67VEI8Ewj4FgQqs6vq3mre8y9GYmh
         O9r5Q4/91P5VwoRlCqQRbYFv7UkyJjNpNJrU77/phNGFVur8NyfZOFuyDZfC+mO+/y9R
         USfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735791519; x=1736396319;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hgcp/rOQr79VmKLIg0j8jrldXJiZHkHt4iM1asDAr8=;
        b=KSGf8ox3TK0pw/wVo3gWuNCTF/963Vy7NjH2Eo6dm53iR7KvhMeGllLiElXNsZVyJw
         RCganFBA0wdwY0GZCK9VTrR6TdnhdXvbPaIO/eZjyg1pi/zXPan6EGTZqyWUUp04IrRL
         nRYny5yvS2n+z/C/UxC11W+XU6b3Uo5FDZzeXKEFxuD+V6SzWxVTO8Jh8AkIDPZgADRw
         /5kkAC3jCkm8aZ1IPxogQlO35zeYHlDaBwyz1EmVIkh+1qDNchpa0+7cexQUg65uLDyC
         zaIlVea1vliuJ+58rn4uIfO0xMTP8PWG/oHCTr5Bg1dgvp8uywSONgqzAjVJtohXFxdD
         Zg0w==
X-Gm-Message-State: AOJu0YyApfIbNA9DWO/Ii1OzUqpXBXjLfaX5ZWck/L/5O3XjrTTTsJS5
	1VaabRdM27Q8I1UnOs8XCk1x9WTkfd2dzMCbLCyMHfLKVVaf2PEMyUHvhhWhofGVfzuzNnOceIs
	CAdjbw1bwzI/HfzAvviTczf+GI/9Dy7ep
X-Gm-Gg: ASbGncu9MzF9jZwXnKrh0V/aLBCl+Ip4n8BKdYuZBstI3ZhNLHXMf9VBP/+sa54Z/AU
	eb3qb59iGCQHy9bK1T/wCyeZ9EJzT+pmAtyPH
X-Google-Smtp-Source: AGHT+IFCg8dvEKDdHKmmrnBZTv0Fd6bIVdJ1n4s3Bavyz+2KnZDRi/KSb/6+q/UbeYqwQvB/o3KdOFwSdvlIu6aIVHI=
X-Received: by 2002:a05:620a:17a0:b0:7b6:e126:3dee with SMTP id
 af79cd13be357-7b9ba71292cmr2445488185a.3.1735791519198; Wed, 01 Jan 2025
 20:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABrqrA6b2y29tC2Z-9H2vYsuP_t5c6uCw9DZrjY7DmeNcczf0w@mail.gmail.com>
In-Reply-To: <CABrqrA6b2y29tC2Z-9H2vYsuP_t5c6uCw9DZrjY7DmeNcczf0w@mail.gmail.com>
From: Allen Toureg <thetanix@gmail.com>
Date: Wed, 1 Jan 2025 20:18:28 -0800
Message-ID: <CABrqrA6vz66mbJTB71Oihvx3bnwBAvxKxC-Ui_F1zbFB7=JSjg@mail.gmail.com>
Subject: Re: md-linear accidental(?) removal, removed significant(?) use case?
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Preamble: I have extensive arrays of drives and due to their irregular
sizes, I was using md-linear as a convenient way to manually
concatenate arrays of underlying MD (raid5/etc) to manually deal with
redundancy.

I have probably a few thousand TB in total raw space, and hundreds of
TB of actual data and files attached to singular systems.

In a recent OS update, I discovered my larger volumes no longer mount
because md-linear has been removed entirely from the kernel as of 6.8.

I am trying to do rationale archaeology. I sent a note to Mr. Neil
Brown who was responsible for the earliest change I found related to
this and he suggested I email regressions and linux-raid along with
the current maintainers about it.

What I've been able to find:

In 2604b703b6b3db80e3c75ce472a54dfd0b7bf9f4 (2006) Neil Brown marked a
MODULE_ALIAS entry for md-personality-1 as deprecated but it appears
the reason was because the form of the personality was changed (not
that the underlying md-linear itself was deprecated.)

d9d166c2a9d5d01af34396793950aa695883eed4 (2006) reinforced this change
via a diff algorithm that overzealously included that line in a diff
chunk but which makes annotating prior to it a more manual process.

608f52e30aae7dc8da836e5b7b112d50a2d00e43 (2021) marked md-linear as
deprecated in Kconfig, using the rationale that md-linear was
deprecated in MODULE_ALIAS=E2=80=94but again which doesn't explain why the
*module* was deprecated and appears to me at least to accidentally
misconstrue the original reason for the deprecation comment.

849d18e27be9a1253f2318cb4549cc857219d991 (2023) eliminated md-linear
entirely, again mostly self-referencing a deprecation notice which was
there in actuality for basically multiple decades and seems to have
referenced something else entirely.

I was hoping you could help me understand why this module was removed?
I have found others who also are running into this. Functionality they
relied on has disappeared, as per the existence of the following:

https://github.com/dougvj/md-linear

https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/34
https://bbs.archlinux.org/viewtopic.php?id=3D294005
(etc)

So, it looks like there are many of us who were still using mdadm to
manage sub-device concatenation, again in my case for 100s of TB of
admittedly casual data storage, and I can't currently find what the
actual actual rationale was for removing it. :(

For utility's sake, I would like to suggest that linear volumes lessen
problems like substriping. I do not think for many of us that
shuffling around a few hundred TB is easy to do at any rate. Currently
I'm manually re-compiling a fairly heavily-modified md-linear as a
user-built module and it seems to work okay. I am definitely not the
only one doing this.

Please consider resurrecting md-linear. :-)

Thank you,
Sincerely,
at
