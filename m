Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366C9225792
	for <regressions@lists.linux.dev>; Thu, 19 Dec 2024 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621065; cv=none; b=f0QqkXNaJflE8WhWNz/EeGLcqkSBMT4SeFZC/JgaCu6JW0jDrOVQT1Tm65EbaAe6yBe5Wc1PiTGU5Oo0gmki6iK2szbpDDqC9Fz+koUKZ1TDPtIqQOGq0YKTBmVusBW3nZOiBTnC6ddqQ/SgX06PyEjQKgP+BLrVPfkx4voR4fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621065; c=relaxed/simple;
	bh=zxUwCM5sVQtWZUAPNomSOSSJKwXbR7V6Cjxc3p7Fj7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7JZwzC0FqEV48K5/V5CieOgQ1YYRPwIg0JUit6GcdCzYJjyRP7obXP6moWMMxdOZOHQ6O5hUBQyIpqn2abpzRPne9EB41XFn51Er76SKWpM879SEYZqMGXkVoVYi5n0w4G3grk6NiuCUjhi8sFv76FCtdi/ME/MXxrprtIAWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOaQhy0Y; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOaQhy0Y"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa67333f7d2so152978366b.0
        for <regressions@lists.linux.dev>; Thu, 19 Dec 2024 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734621060; x=1735225860; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a8c0Ewl7BQkquEtJaiXqSJPyhaxk2Iz2kiqNEhnfoII=;
        b=MOaQhy0Ys/ucTGiMw5EzGOmhQkq4/a2EjWUp5rHH9W6M/6UphQ5+iobcjexj8GlQbD
         df+cU+X2NKie294rNevUHY3DO1mFOU+mf9m1GPAFg4w8XoRXSnlF+DXWTodxwoi4JRvA
         wzds3liJFA9i0AEoljW9Yrdswy3+2dNoj9pvfprWAxjqlYe+SeGTFA1EkfMUfpb3u/fw
         vVgmsh81wAJgwaffE/DFKHN1mfft458ZhKLenB8vPVj1V9RdcNahjtlXtVmm9tP3nyxz
         et6WgooPE5AsHp1v3m7emianYhTsqy0S81v+QerAeJSkoMag5MmhjNHf28XfX07Bt//m
         2LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734621060; x=1735225860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8c0Ewl7BQkquEtJaiXqSJPyhaxk2Iz2kiqNEhnfoII=;
        b=Uc7eafgUrihLwNPzoIsqkFiuAnjNJ0eeMCuhfPOvyf+lLR3tif+GDgRFDKC8pNM2x+
         ghk8aS+ma86abFqM5jwyQ1DhQxxfbJru/Wjz3uyq/29lhknZhmA4iKSZ3KoA3TQa3/uV
         cC6s0gxj9FMmcHHht710IUdZGOdZThcS0FlR22mhATkcLNJUgNuXnDOeTTIqmqdfpRei
         RKDHlt/ZAkGGWWe1jIqMpNH3nOA1XmuM0M0Eq/3UX0NJoKsV9wkD//I76TVEpjviOhaj
         C0qbmW6zj6y0s30wmezY0W60+4cVRb3oi26yiTaj26yMRIr0q+ZoWG5rbxrIo9hUcUUt
         Z5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVp5odK1aW+d3uec+DzPxCcsaajy/YzT4XUJNEU90Mib9my36MkW/+KHJ9K2FZR/JzM0+VpZx88ftQ+xg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5nbEh81+H6VYblYscrp6DjAe9I2yZVrl00RYONw9rHSof0oWG
	NBtd+G5aq1jD2+H/nHadNsCOXNW8mtlF8v88Mn/noBxvu16eERqC9WdGoeTDpLc=
X-Gm-Gg: ASbGncuwPohdS7DB71svlxVt8zDmlwgdxuS9sG3vEHzcRmgbEekKZEXXjh1er8dPhF3
	P+atgQ8qwh6uVABtwsHEiVdNIMIR4/8TG+VijdQZkHOmusptkd14IrojLuvVfJ4T5MK5J01g6jF
	eZpQO+deb4wbhTEftmJxZmvwcqoI7rlexSGF3jgYlY+1bOFqXBzcvT+9/bQjOP5sLJvFLtzHQhw
	se8B6zeqH927uDyGWQ4UPYemwwh63aySSvwKxQ9eVENwY/NhIIUGyFCAaDaPQ==
X-Google-Smtp-Source: AGHT+IEpIUPQqVgupeRzlOrpnAifiL/wITich3F10TXkppCOZb1lR3IE5oC8DUkcXCbnI2ox83X/9w==
X-Received: by 2002:a17:906:3092:b0:aa6:b5e0:8c59 with SMTP id a640c23a62f3a-aabf47f6a50mr576895266b.35.1734621060458;
        Thu, 19 Dec 2024 07:11:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8301bdsm74864266b.31.2024.12.19.07.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 07:10:59 -0800 (PST)
Date: Thu, 19 Dec 2024 18:10:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, qemu-devel@nongnu.org,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Qu Wenruo <wqu@suse.com>,
	David Sterba <dsterba@suse.com>
Subject: Re: qemu-arm64: CONFIG_ARM64_64K_PAGES=y kernel crash on qemu-arm64
 with Linux next-20241210 and above
Message-ID: <a3406049-7ab5-45b9-80bf-46f73ef73a4f@stanley.mountain>
References: <CA+G9fYvf0YQw4EY4gsHdQ1gCtSgQLPYo8RGnkbo=_XnAe7ORhw@mail.gmail.com>
 <CA+G9fYv7_fMKOxA8DB8aUnsDjQ9TX8OQtHVRcRQkFGqdD0vjNQ@mail.gmail.com>
 <ac1e1168-d3af-43c5-9df7-4ef5a1dbd698@gmx.com>
 <feecfdc2-4df6-47cf-8f96-5044858dc881@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feecfdc2-4df6-47cf-8f96-5044858dc881@gmx.com>

On Thu, Dec 19, 2024 at 10:44:12AM +1030, Qu Wenruo wrote:
> 
> 
> 在 2024/12/19 06:37, Qu Wenruo 写道:
> > 
> > 
> > 在 2024/12/19 02:22, Naresh Kamboju 写道:
> > > On Wed, 18 Dec 2024 at 17:33, Naresh Kamboju
> > > <naresh.kamboju@linaro.org> wrote:
> > > > 
> > > > The following kernel crash noticed on qemu-arm64 while running the
> > > > Linux next-20241210 tag (to next-20241218) kernel built with
> > > >   - CONFIG_ARM64_64K_PAGES=y
> > > >   - CONFIG_ARM64_16K_PAGES=y
> > > > and running LTP smoke tests.
> > > > 
> > > > First seen on Linux next-20241210.
> > > >    Good: next-20241209
> > > >    Bad:  next-20241210 and next-20241218
> > > > 
> > > > qemu-arm64: 9.1.2
> > > > 
> > > > Anyone noticed this ?
> > > > 
> > > 
> > > Anders bisected this reported regression and found,
> > > # first bad commit:
> > >    [9c1d66793b6faa00106ae4c866359578bfc012d2]
> > >    btrfs: validate system chunk array at btrfs_validate_super()
> > 
> > Weird, I run daily fstests with 64K page sized aarch64 VM.
> > 
> > But never hit a crash on this.
> > 
> > And the original crash call trace only points back to ext4, not btrfs.
> > 

Yeah.  But it's in the memory allocator so it looks like memory
corruption.  After the ext4 crash then random other stuff starts
crashing as well when it allocates memory.

> > Mind to test it with KASAN enabled?
> 

Anders is going to try that later and report back.

> Another thing is, how do you enable both 16K and 64K page size at the
> same time?
> 
> The Kconfig should only select one page size IIRC.

Right.  We tested 4k, 16k and 64k.  4k pages worked.

> 
> And for the bisection, does it focus on the test failure or the crash?
> 

The crash.

regards,
dan carpenter

