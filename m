Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A721938F626
	for <regressions@lists.linux.dev>; Sat, 28 Feb 2026 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772302199; cv=none; b=pshy4cQlb0M9+DeVniE+7BQL2LHHewuak4HUe+EI2pg4jgbA61Bxt30TCh09xzKPLNOSWGuA9h915YcHN+RLSm8Up38StPSuoEVchHEpVQj2xoaIH3tBJaYZ8O5DFjWb3nNSdip7xaV/vJ2t6qv7hc0UwgMBPwxqjyRenhQvgIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772302199; c=relaxed/simple;
	bh=iJxp27K2crSh+gE05piiN/MCEztPM+7r0qtdz2VNd2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwjgOVnvMypM7K9hRZMxVzEnj7Oi5QgX2f3YRMii5vultsTq9/u2kJAHkfm4fMNfmxrdZCSmK7tBnnJPXwz7aO8UgRQBZ1vE8DI7RPlQwjoxl9BV3269Y9BGphTkMyN4NzGV/25VRRDQy8Ih0YPtvCpoJ9jWGvqjEHokuhNwxog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QCyFSJ46; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QCyFSJ46"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9359c0ec47so334985366b.0
        for <regressions@lists.linux.dev>; Sat, 28 Feb 2026 10:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772302196; x=1772906996; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=upRUuJ7fbRWeF/h8l9JLTjaUFHUxKsrq5unPHAISUXY=;
        b=QCyFSJ463A42VciSMrdQE8ut5XYU/6EK+mzdYy+3qds1VvDAIiehVmkD//tiEpD6Im
         fix9ltnRPyPU8r865GCS61k4B5BaVBREBGt6VNv6jIjai5AKwHprwCrVREVBHVLY4ggo
         v5veZ3/fqqZ5UX52jJT4qjnFGyph9mD8xTdRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772302196; x=1772906996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upRUuJ7fbRWeF/h8l9JLTjaUFHUxKsrq5unPHAISUXY=;
        b=dCRO7/HXPFHjjvqc2KyTeT7O4FuO6KhL2jdxqg8v02dhDOjiISEHndGi0H8gsd6pFv
         wqyHIw8AXHMIoiBELrP9sW1CaZjkHi4HnazNN9tz0qPKXeM2WPQHvl+SSRCUtupxsr3I
         xAP7AgcAxaPIKeovUJV8OvVXIcJsA2Us9VdMDZV14BDOsZ3s6FwFplM8/9KGSrzhq7q/
         o9wcWLf1dbHjKqWHri7TvoJXQSklM3jyyf6tDeYUSiga2RtJbczt+Q7GzVgaSh6kBDtS
         3BTlpJpkdu0Y5avmd3kduRsIe/LVyGYEjNGdp/4C5aJ37EKsKhTpoNYpa2kQW7iZH0F3
         E1bA==
X-Forwarded-Encrypted: i=1; AJvYcCUWT2ryJRa0LRL6U845vb7fLBmxX23Vbjl/jGjgXdZin00Mona+3XIXHkzcOpeqtNugeChRo9fA7/r3fQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF/uDVdw/RbJCEecQSWrlUt1COHaagkzt+IJ7c7+mJTN+JSSqq
	Ub4JfHZq3m2C0Tsx2NBvm3rjlToG1jK8r3Pw/Ze3Yszp4t7zVlJ4jU5Rxgn34q8PaudqS+5pD7R
	Qlc+QYyU=
X-Gm-Gg: ATEYQzzzrU9Tp4KkvsYs3dg0vyjpydQt11x50EZMHhrYLjDVteBsIvWIMqvGOCSp4BO
	S9bN5YW2Jb2C6LU8dqSHPhqb3eN1RnjuDZflU2XcQDVLzrLtJH5VnD3GBWRinBEDJcEP6ajalZm
	/r1rY8shgu2xVFszU/NEP4zxAaN8k0Su/6fJi5GldFjynEFfdq1ixBTOPJ3JpqzzdASNJftCBAa
	bj/sOL5uL0oJL/X/9EyTa7mFpH48Ne/EyoMML68xzZQRHQuc5SwwukqxLDrmXV1parlf3a9zMkG
	TFZPPD3Xd2yRH2WMUDTsqso1It+dG/k296A4Q5+3tl2EFvP+Na83ntbkrwp+oHdqQSadazlRlaV
	ZX/9Ga35MK8jNd4hyvE9T35uY+LZKkRlqMWCF7TuzQbB2J/ughWdvTncoeZbnO7v4TypqWc62I9
	r0Lxy2rNEwcS/pOx4qBAWjf4/wTYY+qYCWSLbJgAY8kJdsoV008EMpbiweAGAiloMAXHHWc5Sya
	DQs0rBQ3OE=
X-Received: by 2002:a17:907:3c8b:b0:b93:8ec3:9c0e with SMTP id a640c23a62f3a-b938ec3a9f2mr177409566b.54.1772302195751;
        Sat, 28 Feb 2026 10:09:55 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab137a1sm266786366b.2.2026.02.28.10.09.55
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 10:09:55 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b904e1cd038so425988666b.1
        for <regressions@lists.linux.dev>; Sat, 28 Feb 2026 10:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+txx7ug/SOYU9iJ2znFFbUyW5DHObARhrao40I/ECSm1HhzPI2KryPJus5wg85o7GpBYby4soIHzLlw==@lists.linux.dev
X-Received: by 2002:a17:907:1b21:b0:b7a:18ba:a63 with SMTP id
 a640c23a62f3a-b9376385788mr449059866b.19.1772302195117; Sat, 28 Feb 2026
 10:09:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <18b0ead7-0a5d-4699-a09d-de5bc2208b68@skogtun.org>
 <CAHk-=whsxHKbtSpiqqQ1V8YDh_zu+CMB=Zt9MxUOmWGocueZNQ@mail.gmail.com>
 <245628b6-6cdb-446c-824d-442100c89da8@skogtun.org> <CAHk-=whxJBPZ=7jpAKgz+5hUjJZ129JJsyA6iEw70Wg58hD0zg@mail.gmail.com>
 <a200d310-e3df-48e4-8376-7bbbb483f2eb@skogtun.org> <CAHk-=wgUmxkjwsWzX1rTo=DTnaouwY-VT8BjrTqfH7RmTwO72w@mail.gmail.com>
 <67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net> <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
In-Reply-To: <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Feb 2026 10:09:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiiwxzvS1t16YNLofoF6afMB3camXdWteswhdpu3TZVvQ@mail.gmail.com>
X-Gm-Features: AaiRm501nApIZidoUu0g1L-3y6oJqWgUvpl6Esdkunmol7eKZ83uObeF8xEQZFw
Message-ID: <CAHk-=wiiwxzvS1t16YNLofoF6afMB3camXdWteswhdpu3TZVvQ@mail.gmail.com>
Subject: Re: [BISECTED]: Black screen on 7.0-rc1
To: Thorsten Leemhuis <regressions@leemhuis.info>, Takashi Sakamoto <takaswie@kernel.org>
Cc: David Gow <david@davidgow.net>, Harald Arnesen <linux@skogtun.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Danilo Krummrich <dakr@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, linux1394-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"

 On Fri, 27 Feb 2026 at 23:22, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Not sure why Takashi did not reply here. Feels a bit like I'm missing
> something.

I wonder if it's because we've been cc'ing the sakamocchi.jp address,
and while that is what Takashi uses for sign-offs and his "From:"
address, John used the kernel.org address and the linux1394-devel
mailing list.

Maybe sakamocchi has some issue?

Anyway, I've taken that fix directly so that we'll have this fixed for rc2.

                    Linus
