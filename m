Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB21CB501
	for <regressions@lists.linux.dev>; Thu, 17 Apr 2025 05:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744866874; cv=none; b=Msa+0pbRRHVT7ZK4cSrHiMtsJeY+fhvxSAig9mNUr1zckPT/w4SVaLnU2QBgjSiqq3fX/VQX81Jp7AdEwCQGFmWBRkeeU9xwHPWa9htaSxM/fnT35OlsipYaWGnJM8rQQk2/7GXOyb5NJpiOrrFRUVvlHP9NuYhNEKDsz5XdYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744866874; c=relaxed/simple;
	bh=cxS3VnSkmgg7XP0hUuThSmPSabdPMl112SqOb4z6NJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFTZCSQI7tQ/PElB/h5eZutUp0GaACSUfQbFmhHV3bKvTIB2QoDTJB5ZFV1O5gPTpCPM9sltJGgRtG9qb9+i3TGGQZvdFc8hgXK2RTvYW30cAV2E6n1Ef2KRYWyTny3wwZAT1Vj2TlWsAqXbR64stgKCiXahNlgI7wOquu/pngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUeCYAs7; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUeCYAs7"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb5ec407b1so48492066b.1
        for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 22:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744866871; x=1745471671; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/6VVGbk7/10nDXV6MbjXzf9QqxxSVAmsbxmL+ya7Ong=;
        b=EUeCYAs7JWDnDCMoPqBc+kFSfLbBrZcxs/6BQnwBCoJpi2neBiqMAOe4JRGRU8QyxA
         J/5rxY2xxySKXmLA8s8tbMAxG/MIbrRLO7r+FVcE5dELek1o100UqCZcIOzXWiUr3ZKP
         ebpwqDgKjImRt9mKjh/+s+wz9M+SkfhtDjcsGLQt66UQzr3TtSrn73ngmGIC/4i7xZxo
         xPCIxBEeZG0Jp7Od78JeSz5a4woBhOGW58aTRRl02uBlepx0GLxzs0vu9KRWcWN9rHuR
         4sVJgJp5ah9jMBEkSjYVcqVKEwfnuEo+AsqFocK9cThsqbKu2Cb1U+hLc51nlsokuzZI
         idIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744866871; x=1745471671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6VVGbk7/10nDXV6MbjXzf9QqxxSVAmsbxmL+ya7Ong=;
        b=TLDV/7TXbJ37KGRPpKBQ4tPmaOABehSZKpReTNOnbIERSRwBYweY/C49WKl5NETBOz
         q6fwOMf+/eM6WpFuNi9xy+xiOh0ryCbRwDX5lMc5lQUltylGSV1DaLUdfQLaeDaeOUCO
         oZ20NuNUe8N1BAzQZ6giF6hWQIsjiJiCbJVDMLvU9TO+A4zY/TIAZxPm96Sy8V/ZHM8v
         NiTumHbcePugpEwmIG+gteWl1kNu+0ZAZVsCvIRKI4t0s5/fJ9S2TsnoC7erwE6Mi2d/
         sGjeda6F+8yRSsFVNMtltLZ1v3+iT71Y83UThVZaNeCOOdfBWGxPDebb50ipSiArz+sR
         k53w==
X-Forwarded-Encrypted: i=1; AJvYcCWhyEGq2MCrTSczqXGU6Vp0dGVgTNDu/rbn2Ii12U7qLpzNBEMMqeQEbUKKZG5U9H5AnaWT6DH0wN/cUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2CuzTE+dSzmfMVGfdTAYQP8cg4f8II2QS13KsR9LneOsY/K0J
	gvZYl3mnjbuq2imu5WkXXe6CRm5HjQkC4HRstMrYYKnWPEP/g4uT
X-Gm-Gg: ASbGncvABLhnWvbV1r9xEbKhbu+L4BTfbl1CmbFmypqKPUurg2woYCfJ1xamuFsDF+R
	r3Ghr9OtGP8Hwbi1rMt2Ut/6Z2vAx/wMzCaITk1IUk95Oj7KVBQh5jDMv2YMHotzlLNCZnUDYBc
	Kh6i3br1cVcoDXgvKEsTXs2ryyF6FVXpwxfehi9WfcCN+geqbWzUrBNVf3n8HMFjNkkncQmPpwq
	HpLpxdMiopFn9TUBRLWLIiKbBAla74jJq9MJyS13WkMASHL6eHD0S07EMGOZRReLbevPvmBorzn
	648kZAsdFRnefXB2F4MustUiSJFNcv/Qscd7oSocGtPV23r1lLXiROpnIEzOlsTCRg==
X-Google-Smtp-Source: AGHT+IGjoVZT2KhQx6/gxqpaGVfcjmGD3TxtHf+gaeBWoPU0zgqTPKr4b5wv8b2GZJFvcegcgg5rMQ==
X-Received: by 2002:a17:906:7311:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-acb429e40b9mr331666266b.30.1744866870346;
        Wed, 16 Apr 2025 22:14:30 -0700 (PDT)
Received: from [192.168.2.22] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d32ec83sm228122766b.162.2025.04.16.22.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 22:14:29 -0700 (PDT)
Message-ID: <060f3d14-e669-4485-98d1-fb89f8cef79b@gmail.com>
Date: Thu, 17 Apr 2025 07:14:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression 6.1.y] Regression from 476c1dfefab8 ("mm: Don't pin
 ZERO_PAGE in pin_user_pages()") with pci-passthrough for both KVM VMs and
 booting in xen DomU
To: Salvatore Bonaccorso <carnil@debian.org>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: David Howells <dhowells@redhat.com>, Christoph Hellwig
 <hch@infradead.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Al Viro <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Logan Gunthorpe <logang@deltatee.com>,
 Hillf Danton <hdanton@sina.com>, Christian Brauner <brauner@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 regressions@lists.linux.dev, "stable@vger.kernel.org Bernd Rinn"
 <bb@rinn.ch>, =?UTF-8?B?S2FycmkgSMOkbcOkbMOkaW5lbg==?=
 <kh.bugreport@outlook.com>, Cameron Davidson <bugs@davidsoncj.id.au>,
 Markus <markus@fritz.box>
References: <Z_6sh7Byddqdk1Z-@eldamar.lan>
 <20250416142645.4392a644.alex.williamson@redhat.com>
 <aAAmQ-sRQhejItzQ@eldamar.lan>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <aAAmQ-sRQhejItzQ@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:50 PM, Salvatore Bonaccorso wrote:
> Hi Alex,
> 
> On Wed, Apr 16, 2025 at 02:26:45PM -0600, Alex Williamson wrote:
>> On Tue, 15 Apr 2025 20:59:19 +0200
>> Salvatore Bonaccorso <carnil@debian.org> wrote:
>>
>>> Hi
>>>
>>> [Apologies if this has been reported already but I have not found an
>>> already filled corresponding report]
>>>
>>> After updating from the 6.1.129 based version to 6.1.133, various
>>> users have reported that their VMs do not boot anymore up (both KVM
>>> and under Xen) if pci-passthrough is involved. The reports are at:
>>>
>>> https://bugs.debian.org/1102889
>>> https://bugs.debian.org/1102914
>>> https://bugs.debian.org/1103153
>>>
>>> Milan Broz bisected the issues and found that the commit introducing
>>> the problems can be tracked down to backport of c8070b787519 ("mm:
>>> Don't pin ZERO_PAGE in pin_user_pages()") from 6.5-rc1 which got
>>> backported as 476c1dfefab8 ("mm: Don't pin ZERO_PAGE in
>>> pin_user_pages()") in 6.1.130. See https://bugs.debian.org/1102914#60
>>>
>>> #regzbot introduced: 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774
>>>
>>> 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774 is the first bad commit
>>> commit 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774
>>> Author: David Howells <dhowells@redhat.com>
>>> Date:   Fri May 26 22:41:40 2023 +0100
>>>
>>>      mm: Don't pin ZERO_PAGE in pin_user_pages()
>>>
>>>      [ Upstream commit c8070b78751955e59b42457b974bea4a4fe00187 ]
>>
>> It's a bad backport, I've debugged and posted the fix for stable here:
>>
>> https://lore.kernel.org/all/20250416202441.3911142-1-alex.williamson@redhat.com/
> 
> Thank you, that worked (replying here as well mainly to fix my mistake
> in the CC to stable@vger.kernel.org, which got truncated to
> table@vger.kernel.org in my initial submission).

I can also confirm the fix works, thanks for the quick response!

Tested-by: Milan Broz <gmazyland@gmail.com>

Milan

