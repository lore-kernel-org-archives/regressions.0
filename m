Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC792E2845
	for <regressions@lists.linux.dev>; Sat, 13 Sep 2025 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757753635; cv=none; b=ti/kUBnMfGP1/u/pCIhRf2xKvsJMJgfeJvA7HihXbhy0jDJz/+b471/ishNVQaVL2SVqmKaH11b+/Oou7LXlT6oRwH2oSrJKZESdeMUH2au4vBlENypTBrQS3dK2zbOfe9dbNnfBf6YX/yj+Q/HUsqGd/4iMH2rBLb8mRJCv3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757753635; c=relaxed/simple;
	bh=hjX/8U9e+Qrmt58XABWZDNFleTWJFxO/SMBT8NBKylk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkMLCxf6u+6+G7KKkCtURN5QNJjv/vXD9EM506dcUtBQFKmEKjBQIt6WEJXxrhIjcDMWcxs8Uqmo0sb5zRf2ZObhM/lHREdqbZbx+jUg7A33JR4M0mn7t2H3Zz1nNfTA3fF4jCvoEvNzpR6Xw4ctwW7LeJjgK+mTRQ6uU9j7GVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNkcLiw/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNkcLiw/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b07883a5feeso474630666b.1
        for <regressions@lists.linux.dev>; Sat, 13 Sep 2025 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757753632; x=1758358432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRBsxly/heSok1/GwCP1v2e7VTjywigrOJtGbwcrN40=;
        b=ZNkcLiw/8BaBYx9TPbUtkiWiLbWkMSmiCv7TfmiYMu9h0q71rmoGKi9HKvvrumoDcO
         s0ptpZY0s+BHJq4K1a09SlHhns+NZGZrArGYnfIkCZesFgKTbrd7EiTZ+a6lOg1JkyYw
         cFlMX6excer+xHQGUgTYnUn6WGI6HLo5CZNSjkxPF+8/JJtTvD0eT65UaNKP179sl0bd
         XFBkveMSIbFljsBii6pQ3hiV0iWjrFvmVyR7RySEDa7Dconet5eYSVjVSQ3Y2IUWNF45
         yaR51sRqrmrQZU71cx1VLjscxWL1SOGHPSjtEN+7KXnf/gMUQIZirpkJhAYAFhx8wnrB
         ZC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757753632; x=1758358432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRBsxly/heSok1/GwCP1v2e7VTjywigrOJtGbwcrN40=;
        b=wIBb9BgH2OQRehdIIRY5/BCXBi+5XEvbO6rGefVDx+peCjoqf9P9tXRdG2SDv91yCR
         BCFXer8h6veX/7nDzPl4A9F4rWXy5HqgFwxknkClW9cQhmL/J1x8s8FLWiXlpFyYQ7Wd
         33nlb5AHwjskpwu9X3adlxwEDkxtgzI9Xy+vnYhJXyHL+te7XvhOCsBol9yYwI5u1GOn
         hzZcbrpW9vTjHf3b4naijFvqPvf4xdOLPPD7MN9AJqbPC73ysWaHrmISuKaubOUJmTXu
         JZ57YZothUtrBF2s6UA13CNuRs3J1Nb1Aor/2X20CcEN5rOS+eNqL/hPnWSKj503z/83
         qGHg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ig6wB+Xu89MiW7buQL1nzEZLHCsXGu03SI6hyAeZLpsme31tyTlYINaNj7eKDJqTfR9Gv3F+/g1GJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvqyIwpzX47zcwonMt2upHDhim2eFVXcwlgta9O2bXT9AZKygb
	zefNuir9sXrEbtFtoigVJcBDNMGym3isXpBCWKqN2sM33m5tXQw+kz8L
X-Gm-Gg: ASbGncsLUm++fiEVkMnNmF2aS9IX/aoOhMMpcFX8VhdGnpaDzCbwbCfPCU8HuZhuq4M
	Sjku2RPze6G1Ze55xtlNjWebqwKds6NiB7QRW3NsRLCQslLVyUYTCWyZNQ45NHC79W7XKm3sU3Z
	tTpwP+b0yzQDyojSlA+K+pcigJvww2n9ojM1eysqCHOTmrcRu4+0rt06MivYVzZGV742Q7KTCTc
	GYruoAY8IHDvXpxv6SmpWoXpPvZwSrX0sjploQv5YplZbFnBeNU0B0afuzdCtCOIWEphKE9Wni8
	LfafEdQh2t76RCAIDBHwGWYtCLPPKAwf7Ksx3IgLmfN4V+nrpyYXWH3LPI5waMJugjqgkeHU6WA
	hJ6TOtQk48bZNZEarvJRwKh6zKK8aPRElhQCdZFgSHddXBS+i8q6mHuGYFLyvCPXDGqU=
X-Google-Smtp-Source: AGHT+IGRNH90vlh6pNSpSkah5E3lqgD6Qwr2bzQ2h7i2Vu2i65lG54BlgGQar3DeQCKypUkZNJ4X9A==
X-Received: by 2002:a17:907:9805:b0:b04:5385:e80 with SMTP id a640c23a62f3a-b07c3a98830mr539708866b.64.1757753631816;
        Sat, 13 Sep 2025 01:53:51 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d09e5414sm218564466b.18.2025.09.13.01.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 01:53:50 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id E9A76BE2DE0; Sat, 13 Sep 2025 10:53:49 +0200 (CEST)
Date: Sat, 13 Sep 2025 10:53:49 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Staffan Melin <staffan.melin@oscillator.se>
Cc: zhangheng <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
Message-ID: <aMUxHZF-7p7--1qS@eldamar.lan>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>

Hi Staffan,

chiming in hopefully it is of help.

On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
> Thank you,
> 
> I tried to apply this patch to 6.12.39, the first problematic kernel, as
> well as 6.12.41, the first bad I tried, and on both I got an error message:
> 
> Applying: HID: quirks: Add device descriptor for 4c4a:4155
> error: patch failed: drivers/hid/hid-quirks.c:1068
> error: drivers/hid/hid-quirks.c: patch does not apply
> Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155
> 
> To which kernel version should I apply the patch?

As the deveopment goes from mainline then down to stable series, the
fix needs to be developed first for mainline. So the patch is targeted
there.

But please find attached an updated patch which hopefully should work
which resolved the context changes.

But ideally you can provide a Tested-by on zhangheng's mainline patch
to get things rolling as needed.

Regards,
Salvatore
