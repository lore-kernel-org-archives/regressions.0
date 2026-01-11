Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C512147F9
	for <regressions@lists.linux.dev>; Sun, 11 Jan 2026 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768109201; cv=none; b=ffMR6mLlPtphAt1JC+Fl99SP3nqq7bkuNTKbg5+5ht84FsH3rLAh1exADPNjUwi6TVi/wPdeXje0OsMGvLaQDyEg8/7/ZXurZXSYK52awYFwU8F4qO72OivULInWs+HEyQ1XuE+B9f1FApX1mPIFOo9TsrnXIgPmEuW0LNIdNYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768109201; c=relaxed/simple;
	bh=eFp1JbwB6pwBFZFxmQ+ff8Ym07+vJLHCcyuxrD/iTFo=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PGJjzQYqRSQx3gK0uRBRo2yuACDAQEJ0+MdxDGkLpvWMMUUS5zs44rWMzhr/TW4HDk5lht4TGvTG1Qz6ZtGZEpqxzBae5pZJZFqVNHiL/MzxV5qAqsmBeds5JzBNmryr9n6IfAdcbNWIp/lP5xwPC2XpeEjVMOCW4yEqWnb17MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGAOfvHT; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGAOfvHT"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4f34c5f2f98so60343801cf.1
        for <regressions@lists.linux.dev>; Sat, 10 Jan 2026 21:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768109198; x=1768713998; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnrpYrRIYSXlW2YfNWkieSaYgDrKbTtuKGx2OJu0pTM=;
        b=iGAOfvHTWB4BPkKNwXFLuqvtOvcQVqklp7MOxkCOjtjt3Scut6FTYJ/asvSsk7eRvm
         W/bWVpGb7av2sxJj0YkK9RfcLHzkRezuHQ3Iua1ToD9kUqQKInnRyxHrUUJdsvySKK02
         susHjFXCgPMNKDrJ7gOZXZFQNipzrGG4vgZTc354XgGi3jdDM6rw8LhEWoaSht2hhcim
         ME0ryV8J/4riuKZ3qfRvDAKpFP0cwdWxiqI6G2vf0MQ4WkTUvoLtUxHJdr6XRQLZ+alx
         f2qlgToDvz4LCq0hitMflvwX/8abx5BPhy3JRhR22BQZ8QeWqgIVVD4woOtZxk+8PsuS
         j9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768109198; x=1768713998;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnrpYrRIYSXlW2YfNWkieSaYgDrKbTtuKGx2OJu0pTM=;
        b=RqJE3oFxSsVZ99JpXZBdHTeJAvMbaocYEuesGQOz+3gdZTAdZx4yJ/d5ximVLxr2R5
         iQjUbuoG1FUYL/YckADGp9OKFjsgFE4M0W1b2bo61axpY3622n+Lw25hnqtCJ8akTyLt
         S8WyWn9cOY8gSaxri30hcUhlw18GKJPOXLE4vBh6EZAly8n34S6Hbr0ogzp5bBQM3XH1
         gftf74v0mxShOmQpct7aPeuUN/Ce7xPDhK/3bAj2i4KyMVFbVGpsfRJfePyfGs8NQe/U
         iMSDcTgCEJoAplwDc46FolqjVw8T+moy1Oxend6iWFq6qLAC3Y1RkYsD58kv52AcasRb
         5LNg==
X-Forwarded-Encrypted: i=1; AJvYcCVpwlxNykndUqCZK+HQTBCBZ7sjwvwhZIgXG0qU7EWWIxXRjpX+UBqs8S6+lWik3iv3YjGU/Lu5u0oNhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ2WZxK1TBznasgqDAZg2eAYkn18E7qxDpGfmYJajfMkQHy2s1
	o+dEk5fbyFVJw6PHQdmQhE03qp0qQ1Je5St41/gigSJSyO/Fpgn2h8c=
X-Gm-Gg: AY/fxX6OuAeAktiEZEE7TzSjEUHPDWYMJJmn/VO5oC85dEcpo5fnj3ElILmQx/v2yDK
	hgC/ijHHh1X9CrG3RAx+/8G3lnA5nsJy51uRU9BSkQy70AycJwhpJS7Mytyw9aqFHz+E6R6wfV5
	ehNsiKR68UaEPFKnTm732Spo18ilSrwaLEJyeQovawKumNxjxbtZHl6+JSMwTE4z4I5mzG+mxAP
	alwOhypLROh/n0nBppXlYGaOCPEqa7rqn5fZqUmB2UFONmototKKhWGKMwJqF4w+dZfJQ3yCU/G
	ip2ZyOmtGVE8MQu8SvumFRMx6nFYKvqtpl46gwO94pIUg8H/tUTWL3ojjqSfZ15duGedOsTGVjK
	IXAxgdgulI2JFtooJ/WDWsDfySTzzpqB5pxXgN4Z8um03225lLouXOxps9MkR79uldcE1pgV/US
	emoKpfLBaOzvzYnApFINn0fg1lZ4MwPlzf6fsmXIo=
X-Google-Smtp-Source: AGHT+IHQl6yFzxp8o7DLX3rtK4HUBNR2DuuHigCF0nkzFaedMhsnKWOHtdCDrOaqoDZhFhU2TS5YvQ==
X-Received: by 2002:ac8:5f48:0:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4ffb491045cmr213358841cf.37.1768109197681;
        Sat, 10 Jan 2026 21:26:37 -0800 (PST)
Received: from [120.7.1.23] (135-23-93-252.cpe.pppoe.ca. [135.23.93.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa926a9d9sm102307371cf.25.2026.01.10.21.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 21:26:37 -0800 (PST)
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
From: Woody Suwalski <terraluna977@gmail.com>
To: Vitaly Chikunov <vt@altlinux.org>, Junjie Cao <junjie.cao@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Zsolt Kajtar <soci@c64.rulez.org>,
 Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <aU23brU4lZqIkw4Z@altlinux.org>
 <e6aac320-846d-eecf-0016-23b56d7cd854@gmail.com>
Message-ID: <b3672ea8-ec45-b5d1-cb08-b83eb8697904@gmail.com>
Date: Sun, 11 Jan 2026 00:26:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101
 Firefox/128.0 SeaMonkey/2.53.23
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e6aac320-846d-eecf-0016-23b56d7cd854@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Woody Suwalski wrote:
> Vitaly Chikunov wrote:
>> Dear linux-fbdev, stable,
>>
>> On Mon, Oct 20, 2025 at 09:47:01PM +0800, Junjie Cao wrote:
>>> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>>> character value masked by 0xff/0x1ff, which may exceed the actual 
>>> font's
>>> glyph count and read past the end of the built-in font array.
>>> Clamp the index to the actual glyph count before computing the address.
>>>
>>> This fixes a global out-of-bounds read reported by syzbot.
>>>
>>> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>>> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>> Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>> This commit is applied to v5.10.247 and causes a regression: when
>> switching VT with ctrl-alt-f2 the screen is blank or completely filled
>> with angle characters, then new text is not appearing (or not visible).
>>
>> This commit is found with git bisect from v5.10.246 to v5.10.247:
>>
>>    0998a6cb232674408a03e8561dc15aa266b2f53b is the first bad commit
>>    commit 0998a6cb232674408a03e8561dc15aa266b2f53b
>>    Author:     Junjie Cao <junjie.cao@intel.com>
>>    AuthorDate: 2025-10-20 21:47:01 +0800
>>    Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>    CommitDate: 2025-12-07 06:08:07 +0900
>>
>>        fbdev: bitblit: bound-check glyph index in bit_putcs*
>>
>>        commit 18c4ef4e765a798b47980555ed665d78b71aeadf upstream.
>>
>>        bit_putcs_aligned()/unaligned() derived the glyph pointer from 
>> the
>>        character value masked by 0xff/0x1ff, which may exceed the 
>> actual font's
>>        glyph count and read past the end of the built-in font array.
>>        Clamp the index to the actual glyph count before computing the 
>> address.
>>
>>        This fixes a global out-of-bounds read reported by syzbot.
>>
>>        Reported-by: 
>> syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>        Closes: 
>> https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>>        Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>        Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>>        Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>        Signed-off-by: Helge Deller <deller@gmx.de>
>>        Cc: stable@vger.kernel.org
>>        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>>     drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>     1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> The minimal reproducer in cli, after kernel is booted:
>>
>>    date >/dev/tty2; chvt 2
>>
>> and the date does not appear.
>>
>> Thanks,
>>
>> #regzbot introduced: 0998a6cb232674408a03e8561dc15aa266b2f53b
>>
>>> ---
>>> v1: 
>>> https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
>>> v1 -> v2:
>>>   - Fix indentation and add blank line after declarations with the 
>>> .pl helper
>>>   - No functional changes
>>>
>>>   drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/bitblit.c 
>>> b/drivers/video/fbdev/core/bitblit.c
>>> index 9d2e59796c3e..085ffb44c51a 100644
>>> --- a/drivers/video/fbdev/core/bitblit.c
>>> +++ b/drivers/video/fbdev/core/bitblit.c
>>> @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct 
>>> vc_data *vc, struct fb_info *info,
>>>                        struct fb_image *image, u8 *buf, u8 *dst)
>>>   {
>>>       u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>>> +    unsigned int charcnt = vc->vc_font.charcount;
>>>       u32 idx = vc->vc_font.width >> 3;
>>>       u8 *src;
>>>         while (cnt--) {
>>> -        src = vc->vc_font.data + (scr_readw(s++)&
>>> -                      charmask)*cellsize;
>>> +        u16 ch = scr_readw(s++) & charmask;
>>> +
>>> +        if (ch >= charcnt)
>>> +            ch = 0;
>>> +        src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>>             if (attr) {
>>>               update_attr(buf, src, attr, vc);
>>> @@ -112,14 +116,18 @@ static inline void bit_putcs_unaligned(struct 
>>> vc_data *vc,
>>>                          u8 *dst)
>>>   {
>>>       u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>>> +    unsigned int charcnt = vc->vc_font.charcount;
>>>       u32 shift_low = 0, mod = vc->vc_font.width % 8;
>>>       u32 shift_high = 8;
>>>       u32 idx = vc->vc_font.width >> 3;
>>>       u8 *src;
>>>         while (cnt--) {
>>> -        src = vc->vc_font.data + (scr_readw(s++)&
>>> -                      charmask)*cellsize;
>>> +        u16 ch = scr_readw(s++) & charmask;
>>> +
>>> +        if (ch >= charcnt)
>>> +            ch = 0;
>>> +        src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>>             if (attr) {
>>>               update_attr(buf, src, attr, vc);
>>> -- 
>>> 2.48.1
>>>
> I have done the same bisecting work, too bad I did not notice Vitaly's 
> work earlier :-(
>
> There is a "cheap" workaround for systems before 5.11, (not addressing 
> the root issue but) working:
>
> diff --git a/drivers/video/fbdev/core/bitblit.c 
> b/drivers/video/fbdev/core/bitblit.c
> index 7c2fc9f..c5a1a9d 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -86,7 +86,7 @@ static inline void bit_putcs_aligned(struct vc_data 
> *vc, struct fb_info *info,
>      while (cnt--) {
>          u16 ch = scr_readw(s++) & charmask;
>
> -        if (ch >= charcnt)
> +        if (charcnt && ch >= charcnt)
>              ch = 0;
>          src = vc->vc_font.data + (unsigned int)ch * cellsize;
>
> @@ -125,7 +125,7 @@ static inline void bit_putcs_unaligned(struct 
> vc_data *vc,
>      while (cnt--) {
>          u16 ch = scr_readw(s++) & charmask;
>
> -        if (ch >= charcnt)
> +        if (charcnt && ch >= charcnt)
>              ch = 0;
>          src = vc->vc_font.data + (unsigned int)ch * cellsize;
>
> I will try next to go full backport from 5.11 as Thorsten has suggested.
>
> However the bigger problem is that the fbdev patch has landed in the 
> 5.4.302 EOL, and essentially the 5.4 EOL kernel is now hanging broken :-(
>
> Thanks, Woody
>
I have tested the solution of backporting the series of patches from 
5.11, it seems to be working OK.
However for the soon-to-be-EOL 5.10 and already EOL'ed 5.4 I would 
suggest a simpler solution where we replace  most of the logic from 5.11 
with a hardcoded charcnt=256, if charcnt not set. This would take 
advantage of the bugfix from Junjie, and be a minimal change for the 
5.10 kernel (works on 5.4 as well)

--- a/drivers/video/fbdev/core/bitblit.c    2026-01-10 
16:28:37.438569812 -0500
+++ b/drivers/video/fbdev/core/bitblit.c    2026-01-10 
16:32:51.356236549 -0500
@@ -86,6 +86,8 @@ static inline void bit_putcs_aligned(str
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

+        if (charcnt == 0)
+            charcnt = 256;
          if (ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;
@@ -125,6 +127,8 @@ static inline void bit_putcs_unaligned(s
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

+        if (charcnt == 0)
+            charcnt = 256;
          if (ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;

Thanks, Woody


