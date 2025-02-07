Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995C51ADFE4
	for <regressions@lists.linux.dev>; Fri,  7 Feb 2025 20:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960554; cv=none; b=FvRl7Ze0/+2VafbRMzaVTP7Jjbpgqx/j+nA1/MVjHVQDmNIr3Z65Lkb77DGNemjej/J4pCHnAwqxtvSWFydGuoYKfD1A8Gsz5DX/dvA/y2W8AN3nrAZJa9UnGg3vf6Vy0IjUncRnqsYehveGb4li6ngG1sMA1pKX/CTITE+ieWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960554; c=relaxed/simple;
	bh=tmsgJf6D+fDf+JdDrEPnnhzZGjpM29ZUYdeQEOYtERo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAueN/TDO2SU+cR8IJ/ygA5LUjWqovNyT9MMlh6WRVRY26Fo6HSC4x4l2JYuxb8JaTmAmLNjy+HyIwBXNcUhvoE6eUG5w26NTiHPcbSOpBqRQf1HiIRTlB+eeX1y3Abri3RkRz0Zwrd/xh6pzYc3dK2/ZIA9Sm3o1TFtneAUtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jjr6Kdr1; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jjr6Kdr1"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3061f1e534bso23941521fa.1
        for <regressions@lists.linux.dev>; Fri, 07 Feb 2025 12:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738960551; x=1739565351; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f+5xpx9eT+J4scyTgocR/Kkt5f8iTTBFTkmVmuOtdQE=;
        b=Jjr6Kdr14nUAmuhKz2RLGMYLR0W+D2PjUMle5aCOwymCfhEIWvIGdASxb3o2gW7Ova
         gzL5ZoiM2KIAnguytT+oGE04v/HvkNKm15A6BT3G6dYzEG3zF3PudnOOR1pD3nn5FarS
         crD2lhwOu/h9thrJnTDJDCtyM6lFm245ydHWMhG5PKM6fLLdYJuWFsj5Yf87ZeFLH1GC
         qoBRBKKtfuvEnybTSmyUQ5S6qf11mfsBTkrjE8eIoWSwc78hF28vrMxpEIAfi+xCRzla
         1A5MVR0q1V0X9zGoWPoEt5tevzS7GHQVnAtE7H5XjAQEvV2zNA5x4E/OVHgPBQiOh3sw
         u11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960551; x=1739565351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+5xpx9eT+J4scyTgocR/Kkt5f8iTTBFTkmVmuOtdQE=;
        b=UtchxUIeANQOJDBBgtjYLB+ai8U5MXROlPp2PgOkW/gK2zLMJrR8FZNwzmUp6i1xCi
         DJhxEJm4Jwp9qoM4T0H7jC7ybzha1wK1KWdD0JaoN8LLbk/UtZrn0lOnFgi2WUZjWR5P
         /Rn+ObLe3zoa0JmRCXhwP0fojKIWnS4O0H09HMncVLgEne7iEJFKQIVcjLh5hzWMGj4u
         Y350NKLWSnSqGCXwpOF767cV9x3AXdIZtX6Nu1diy87kWWdayEL/1on1Ntvd9bop5ia2
         82ysc8lJtbWchUBkVoSJ81mVP1GPnp0tp9Y7qYKJJ6zmQwR4//FgFn3SZcQ4mffPSG3I
         CWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIJLRKx9LomNM2mxVSmN2yB+BfcAwW7ZmsqwwEbcsApyK3JuLfZXTQ0vrNCtkj7+Ok8FR63xnljVA/LA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKaGMtgnqbgLFWr2qsYopo6r0545JudiXju79yU6fd+RTZE/xn
	MWlhI7vytT6wEKFooIc0fVqNkM1ogWXGK6JZ4+Ps1/7qhdk8GhHa
X-Gm-Gg: ASbGncv7Tmrz/J2Gd+gDNVxrT6tTkQrmbzhqeZhgeJs2L0Q44b6BvDgn32BgtwvGyMV
	D3AG58RekOsJPEirVnsspeVk9AVtvC56sjIirmBJ8A/y+5znM9/7PYKIlL22HRqr/Lr6RN1uNK5
	JKUVRY6EDSR6j/WrhzMa3ANBf2NN//Rn2O8zncxy+WrG6/M7GN6NBETmBIn8ysIO30m0juGVav9
	uC5KtWzBrtyPIfLb/QMR5FgZpRr9o/P99+zG4ax8RU4QvhdE5dWAWbkFfTZA0p9LHS6YdqKK75G
	p9+pHCZxDIx0fQl1cJ34lVoeCW2TDf3xr/yNOFYR
X-Google-Smtp-Source: AGHT+IGXLuEDVkXqFHhIEvSMZ8H84+syWqIGRwsV4MnwETJ8zqIEG5bDWr9dtb2jvk0PLOFM95kryg==
X-Received: by 2002:ac2:4ed0:0:b0:544:1151:a4c1 with SMTP id 2adb3069b0e04-54414a9d156mr1357998e87.22.1738960550222;
        Fri, 07 Feb 2025 12:35:50 -0800 (PST)
Received: from [10.147.2.13] ([85.206.91.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410604076sm539633e87.229.2025.02.07.12.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:35:49 -0800 (PST)
Message-ID: <f999c3ea-a928-4323-ac88-7a0e9d57fbce@gmail.com>
Date: Fri, 7 Feb 2025 22:35:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Bernd Schubert <bernd@bsbernd.com>, Vlastimil Babka <vbabka@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Matthew Wilcox <willy@infradead.org>,
 Christian Heusel <christian@heusel.eu>, Josef Bacik <josef@toxicpanda.com>,
 Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joanne Koong <joannelkoong@gmail.com>, linux-mm <linux-mm@kvack.org>
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <Z6XWVU6ZTCIl3jnc@casper.infradead.org>
 <03eb13ad-03a2-4982-9545-0a5506e043d0@suse.cz>
 <CAJfpegtvy0N8dNK-jY1W-LX=TyGQxQTxHkgNJjFbWADUmzb6xA@mail.gmail.com>
 <f8b08ef9-5bba-490c-9d99-9ab955e68732@suse.cz>
 <94df7323-4ded-416a-b850-41e7ba034fdc@bsbernd.com>
Content-Language: en-US, lt
From: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Autocrypt: addr=grawity@gmail.com; keydata=
 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
 aETxZy4lQ+jpsbG/q9fvS/sAZA==
In-Reply-To: <94df7323-4ded-416a-b850-41e7ba034fdc@bsbernd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-07 13:16, Bernd Schubert wrote:
> On 2/7/25 11:55, Vlastimil Babka wrote:
>> On 2/7/25 11:43, Miklos Szeredi wrote:
>>> On Fri, 7 Feb 2025 at 11:25, Vlastimil Babka <vbabka@suse.cz> wrote:
>>>
>>>> Could be a use-after free of the page, which sets PG_lru again. The list
>>>> corruptions in __rmqueue_pcplist also suggest some page manipulation after
>>>> free. The -1 refcount suggests somebody was using the page while it was
>>>> freed due to refcount dropping to 0 and then did a put_page()?
>>>
>>> Can you suggest any debug options that could help pinpoint the offender?
>>
>> CONFIG_DEBUG_VM enables a check in put_page_testzero() that would catch the
>> underflow (modulo a tiny race window where it wouldn't). Worth trying.
> 
> I typically run all of my tests with these options enabled
> 
> https://github.com/bsbernd/tiny-qemu-virtio-kernel-config
> 
> 
> If Christian or Mantas could tell me what I need to install and run, I
> could probably quickly give it a try.

I used the "Obfuscate" app:
https://flathub.org/apps/com.belmoussaoui.Obfuscate

Selecting a JPEG/PNG file in GNOME's file browser (Nautilus) and 
choosing "Open with > Obfuscate" reliably triggers the bug. (Running 
`com.belmoussaoui.Obfuscate` and opening a file from within the app 
likely would, too, but at the time I didn't try that.)
