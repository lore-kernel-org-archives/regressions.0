Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AD612B6C
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711385817; cv=none; b=T/Z6z/rpY9MMijw/yAEuvYTB+yul+xbP++qnIYlcQOQhJ2JMkRu71W98wMwPVOZ4e+9PqgiDXccrytRF7100YxnvMHjrB+t87jUhawhT7AmOihcy+wkAc+zQ1T4I6CZYFoAWjyJP6CIoB4AvyZIDxeD9K7BFrlqIiNmlmFbQVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711385817; c=relaxed/simple;
	bh=xPp/RUzgQsiSSqM+nB7eJxXqxjfyHTpV6y11jbU95bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLCH/4gXl2YcZVZbRUgBNOh+ohKZ5buF5g8AV41S+TH4XQuCcj7CkvC9mu3gPGp9p90CGthnG9yVPMEKgfFnLHS7FW5TzWH9ajyPPm11ptNeVNc5vHDv793nu00ObdvtsjMxJF55u1D+zcszg9f8EVrkbFtoMennnvrKv4+59SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G1+UiDw5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G1+UiDw5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b729669bso3773259b3a.3
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711385815; x=1711990615; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv8OSr8XfO/UGe4RvS9k3B7kgKFsdVwGKtydzmzsC34=;
        b=G1+UiDw5ZA0EgaS7CCHVdp770+zbCbMV0Y0vuUxifikQmWT6ZwBMZSp8WTa9ohSuW8
         E4pR3KwomGkjpsAl5wuln+EE2MFMd9pJxDqd46LiWf+1fJ9W8Y8b6o9mgPvdYg+ulTqW
         YGbKnQzu1aFdlOoImwuOGqqHKbj2CTO7QoR68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385815; x=1711990615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uv8OSr8XfO/UGe4RvS9k3B7kgKFsdVwGKtydzmzsC34=;
        b=mW0Je5shO1p/U5uZlz7GK7uzl/rMN52PWCVLvbAp5MDLugPCQ0AUirjYTBYxTeO3O5
         eyqq4VAsBehfU02+7idUG1z6kVHTHhjiwdRG5DLdRpNLCR01rSv+SnTl8Exz2LJCH76n
         AqofKa8lQbXkZjKAykeuV2pMKSyVdK/eB8mcZVAysMrwGhK/q4jjTzflxAUGodxokjWJ
         GDlAAeGei2QYRvy+Q4NEPxj83ry2Jobi+d0OpTYbSmqZZFPYaV1YUEd2549/3jlT+N/K
         5sreQl3jB2VLkRkACoTUAN+tK7g4KgM3UumBQp67Kj3CmZ7Dy7CKcIUQOIPoCGlvnjL2
         ydig==
X-Gm-Message-State: AOJu0Yyt9MLzUSn3qVtsoUILIoRu8wHty8zTTmRKJBLqtQt9b8AtY7MF
	3OaY2yYBo6ibz3y7BZfDhivBAeyGaxEs5mzvpj3Jsd0acNeuZmO5TSVgWSt4Lg==
X-Google-Smtp-Source: AGHT+IFJxDTO0PPcnDj1vjtBLWF+b9VN6OetGp9OFxlLXp0FJcL16ixfPvEZpVS4aubfeA3ZUF7duQ==
X-Received: by 2002:a05:6a00:2eaa:b0:6e7:29dd:84db with SMTP id fd42-20020a056a002eaa00b006e729dd84dbmr10135239pfb.31.1711385815206;
        Mon, 25 Mar 2024 09:56:55 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b7-20020a62cf07000000b006e6aee6807dsm4500309pfg.22.2024.03.25.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:56:54 -0700 (PDT)
Date: Mon, 25 Mar 2024 09:56:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Jan Bujak <j@exia.io>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk, brauner@kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: Recent-ish changes in binfmt_elf made my program segfault
Message-ID: <202403250949.3ED2F977@keescook>
References: <c7209e19-89c4-446a-b364-83100e30cc00@exia.io>
 <874jf5co8g.fsf@email.froward.int.ebiederm.org>
 <202401221226.DAFA58B78@keescook>
 <87v87laxrh.fsf@email.froward.int.ebiederm.org>
 <202401221339.85DBD3931@keescook>
 <95eae92a-ecad-4e0e-b381-5835f370a9e7@leemhuis.info>
 <202402041526.23118AD@keescook>
 <51f61874-0567-4b4f-ab06-ecb3b27c9e41@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f61874-0567-4b4f-ab06-ecb3b27c9e41@leemhuis.info>

On Mon, Mar 25, 2024 at 04:26:56PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 05.02.24 00:27, Kees Cook wrote:
> > On Thu, Feb 01, 2024 at 11:47:02AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> >> for once, to make this easily accessible to everyone.
> >>
> >> Eric, what's the status wrt. to this regression? Things from here look
> >> stalled, but I might be missing something.
> >>
> >> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > 
> > If Eric doesn't beat me to it, I'm hoping to look at this more this
> > coming week.
> 
> Friendly reminder: that was quite a while ago by now and it seems
> neither you nor Eric looked into this. Or was there some progress and I
> just missed it?

The original reporter hasn't responded to questions and no one else has
mentioned this issue, so I think we can remove this from the tracker.

#regzbot resolve: regression is not visible without manually constructing broken ELF headers


-- 
Kees Cook
