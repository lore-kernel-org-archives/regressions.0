Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC63382F6
	for <regressions@lists.linux.dev>; Sat, 10 Jan 2026 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768051220; cv=none; b=Da/OLnwhAcfWZPRQx6koaDyAEt4LijGxpGbJU1gEsyPawbqMK+Kba3D3xDkH8dz2fVjh6M82Qhm6c1RN04bjdSZcvJOa8Fw8HdbdbPoc2fonWXZtusFFT9rsS0S3eP16sJVjWcRsGKXCU83WzD55WZ0e3Tabckx17lbjbGPrb3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768051220; c=relaxed/simple;
	bh=mcWwAQmDQrBxrpitpaStI5w0TayFDLq0q7csjwNorjg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=g5PtHblJlUiECfIZc4LgSGJwaZsOJbL93gKXllvkcgj+1Z0aQTNGIZL7Vj7OvzCIcmUut5OLs7WI8qd4ArBio0sPW69aLWNwVeGwMD6TaX2dihHHJOvRZn76zoBb/m966Hil1Vlg3HTW5ZSvTL2iKAG9cbCsIFIBwJRlqt6s4jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmjHQXMG; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmjHQXMG"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8ba0d6c68a8so586215985a.1
        for <regressions@lists.linux.dev>; Sat, 10 Jan 2026 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768051218; x=1768656018; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvmFtpYq3AhGNwfLF6kPdeLfesgtuyHszNnUMDnYmVI=;
        b=SmjHQXMGJwcaVDlQh8uoZquriuT/O0KnaqA5PvwG782ODEvUkBbgT3F64wwX9IGGxt
         UBkA52S9O6xqy4jyXVhwukUi4gmSfiIHWqrDGWjmAq7Pnd1IMDt8DK7exYZCt/KQjq1u
         R6Va6prAbuQG4sl9nWsDWp6Yb3pwLFQnsOK4BsL+tlqeY7i+WCjRkP5gjn8VlEHvYH6V
         uB0Mu3HER0fq6NE+Lw0tg1nvGKSX+4ETWe8F/mXiCiONx0TqFDGRpy9/WQCskCf4DuGQ
         ZwNagpR2/f0GcOLV4QIXHgVTlKcV4gkVA8j57WpkMuYRm5+8DP5n0vPlIhzyeOD2A2is
         Ddng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768051218; x=1768656018;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvmFtpYq3AhGNwfLF6kPdeLfesgtuyHszNnUMDnYmVI=;
        b=Oc4S9UY4SdflLxauDpQrptyH2N7KvWCd5zJ9Sgvc0mo1R8B6ayvMCAiVM6ylFH865Z
         1P9kKfiMu2nT1colkLzO4DE+SqYhS6zTec2Xk+P6IkjA+1IQ9d1dOrqIjxT6/UnToDLW
         3ClAow4rFcHTYYz+UMaIDCrQH03BUhLb+Sk7acZABt8dYhzIHB2CSkrgU2S5zcGj/3VC
         kIMVEvvzMMMwv4aTGS0bCc9FtFExIOpSnEj00aoBPMJUFtTPLi4tiXdvt6Td6kbhinZ7
         UxqRABu6lN6vFeR8oUtD/aVXgUe2M3MdqBlKCtQKvXWSOhKAUE+fab3BtMMjhF6SBr/5
         zeeg==
X-Forwarded-Encrypted: i=1; AJvYcCXSrrHbuTkX6up79aXKo6AFlaL7VBP7CpLVRCpa/QLOzgeEtsJjPXHS9mN1cLuO8my+Z59MmPQn2p6Tmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLE9eh4WKnBiypPFoHVtIHK8ZdHtmKJsE5ydhwfb9n4+VXA1Fv
	pjcwOjtO2OmyeBuAp+jGsxfSUECa+OJOkkKhJDrNXi/mmDdDmd/x5no=
X-Gm-Gg: AY/fxX5fXfxva7iMLuO/l4PIuDJ8iIrPT8IVdu6OtfPl6V/N6Mw80dha0oBV6EC3iFe
	fQLqlAvko8LvKbw0jhSnvIrWso59MzzWD2wuHATSTVamjFMsVbfLM405mWjkIjn0QEH+eSLGn4B
	nlgC+eSEeuK1y/ZnuWts+mHLN8wnrC1liRrmIoGGk3BdnHkHHt6+kL0dnrI5XylkjkI7QOMoqXU
	lzeFNOOT1P6iwlEzfBiknQc4mpx9dg3uSdcumz7kRWcVmweeoay+sqNQa+gLMEqbbPPMS00hkKm
	a1+oNxbEmoHsdNzs9uo3UGBo1Mxw61+SYTLUakRUHdJOva19UwUdeMntS5JQ7fdHKTFJCdql+RZ
	wG2BQFsa0M4lag5PODCUYsblXk79u0uonyuhqYaLoG4/hEW2ad7BfeQe2E+9rvVG7x6pI4/aUQx
	OmhncGIf4tbtBPn4LgjM5KDIap8xvNZJ2MbShlzUY=
X-Google-Smtp-Source: AGHT+IHYkrReK4yF4naTlaDor67swNTpLoEWAakzLr0Pf9Lu/+qdcpqgONPLVqMEeWigmof52e/WWw==
X-Received: by 2002:a05:620a:2910:b0:8a1:ac72:e3db with SMTP id af79cd13be357-8c389429138mr1637486585a.72.1768051218033;
        Sat, 10 Jan 2026 05:20:18 -0800 (PST)
Received: from [120.7.1.23] (135-23-93-252.cpe.pppoe.ca. [135.23.93.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51d06fsm1031114585a.32.2026.01.10.05.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 05:20:17 -0800 (PST)
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
To: Vitaly Chikunov <vt@altlinux.org>, Junjie Cao <junjie.cao@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Zsolt Kajtar <soci@c64.rulez.org>,
 Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <aU23brU4lZqIkw4Z@altlinux.org>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <e6aac320-846d-eecf-0016-23b56d7cd854@gmail.com>
Date: Sat, 10 Jan 2026 08:20:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101
 Firefox/128.0 SeaMonkey/2.53.23
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aU23brU4lZqIkw4Z@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Vitaly Chikunov wrote:
> Dear linux-fbdev, stable,
>
> On Mon, Oct 20, 2025 at 09:47:01PM +0800, Junjie Cao wrote:
>> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>> character value masked by 0xff/0x1ff, which may exceed the actual font's
>> glyph count and read past the end of the built-in font array.
>> Clamp the index to the actual glyph count before computing the address.
>>
>> This fixes a global out-of-bounds read reported by syzbot.
>>
>> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>> Signed-off-by: Junjie Cao <junjie.cao@intel.com>
> This commit is applied to v5.10.247 and causes a regression: when
> switching VT with ctrl-alt-f2 the screen is blank or completely filled
> with angle characters, then new text is not appearing (or not visible).
>
> This commit is found with git bisect from v5.10.246 to v5.10.247:
>
>    0998a6cb232674408a03e8561dc15aa266b2f53b is the first bad commit
>    commit 0998a6cb232674408a03e8561dc15aa266b2f53b
>    Author:     Junjie Cao <junjie.cao@intel.com>
>    AuthorDate: 2025-10-20 21:47:01 +0800
>    Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>    CommitDate: 2025-12-07 06:08:07 +0900
>
>        fbdev: bitblit: bound-check glyph index in bit_putcs*
>
>        commit 18c4ef4e765a798b47980555ed665d78b71aeadf upstream.
>
>        bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>        character value masked by 0xff/0x1ff, which may exceed the actual font's
>        glyph count and read past the end of the built-in font array.
>        Clamp the index to the actual glyph count before computing the address.
>
>        This fixes a global out-of-bounds read reported by syzbot.
>
>        Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>        Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>        Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>        Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>        Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>        Signed-off-by: Helge Deller <deller@gmx.de>
>        Cc: stable@vger.kernel.org
>        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>     drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>     1 file changed, 12 insertions(+), 4 deletions(-)
>
> The minimal reproducer in cli, after kernel is booted:
>
>    date >/dev/tty2; chvt 2
>
> and the date does not appear.
>
> Thanks,
>
> #regzbot introduced: 0998a6cb232674408a03e8561dc15aa266b2f53b
>
>> ---
>> v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
>> v1 -> v2:
>>   - Fix indentation and add blank line after declarations with the .pl helper
>>   - No functional changes
>>
>>   drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
>> index 9d2e59796c3e..085ffb44c51a 100644
>> --- a/drivers/video/fbdev/core/bitblit.c
>> +++ b/drivers/video/fbdev/core/bitblit.c
>> @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
>>   				     struct fb_image *image, u8 *buf, u8 *dst)
>>   {
>>   	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>> +	unsigned int charcnt = vc->vc_font.charcount;
>>   	u32 idx = vc->vc_font.width >> 3;
>>   	u8 *src;
>>   
>>   	while (cnt--) {
>> -		src = vc->vc_font.data + (scr_readw(s++)&
>> -					  charmask)*cellsize;
>> +		u16 ch = scr_readw(s++) & charmask;
>> +
>> +		if (ch >= charcnt)
>> +			ch = 0;
>> +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>   
>>   		if (attr) {
>>   			update_attr(buf, src, attr, vc);
>> @@ -112,14 +116,18 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
>>   				       u8 *dst)
>>   {
>>   	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>> +	unsigned int charcnt = vc->vc_font.charcount;
>>   	u32 shift_low = 0, mod = vc->vc_font.width % 8;
>>   	u32 shift_high = 8;
>>   	u32 idx = vc->vc_font.width >> 3;
>>   	u8 *src;
>>   
>>   	while (cnt--) {
>> -		src = vc->vc_font.data + (scr_readw(s++)&
>> -					  charmask)*cellsize;
>> +		u16 ch = scr_readw(s++) & charmask;
>> +
>> +		if (ch >= charcnt)
>> +			ch = 0;
>> +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>   
>>   		if (attr) {
>>   			update_attr(buf, src, attr, vc);
>> -- 
>> 2.48.1
>>
I have done the same bisecting work, too bad I did not notice Vitaly's 
work earlier :-(

There is a "cheap" workaround for systems before 5.11, (not addressing 
the root issue but) working:

diff --git a/drivers/video/fbdev/core/bitblit.c 
b/drivers/video/fbdev/core/bitblit.c
index 7c2fc9f..c5a1a9d 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -86,7 +86,7 @@ static inline void bit_putcs_aligned(struct vc_data 
*vc, struct fb_info *info,
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

-        if (ch >= charcnt)
+        if (charcnt && ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;

@@ -125,7 +125,7 @@ static inline void bit_putcs_unaligned(struct 
vc_data *vc,
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

-        if (ch >= charcnt)
+        if (charcnt && ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;

I will try next to go full backport from 5.11 as Thorsten has suggested.

However the bigger problem is that the fbdev patch has landed in the 
5.4.302 EOL, and essentially the 5.4 EOL kernel is now hanging broken :-(

Thanks, Woody

