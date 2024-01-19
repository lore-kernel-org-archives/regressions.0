Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6DA524CF
	for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705698120; cv=none; b=FkTLz8sNBqR4uNs+WN8rCYJ9Jd/WlNDYVerydQWJHpnF4+OqI41LAGeqloiXJ4DvqW8zueZfqvPX55rfoTzskLiNu4VWy27P8IbW8yu16rxVv/zoaZkfwtVyCW3pVXXwgAl95dYxxcmzIBRJfIYb+S9FufkkqAGXNv8Q/pibnSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705698120; c=relaxed/simple;
	bh=4AWBUqGn52z//Z8+W5TPR4hHK4Fbb3QJg61PK0ynKPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKXvJFo2LUy0u0MT1PhbSCbLaVj3oDUK1CO0a9806l7sJL8yDPt66KPxiwyoq7/5GfpN22oxquQOSgBsVG4UE2FD/AJopuQhslOmeJWxlk7EwWjgC7Y04s2XlDBOWIs5Y16b5ibRNordgJGXV0n2AcksooeQ+fbxO4dn0mEsU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=N13fLyo0; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="N13fLyo0"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-361aa00caf5so55195ab.0
        for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 13:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705698117; x=1706302917; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jG9+AFkJLNvflocjNZF15QhqO4HCzitJO63mbz/u+8=;
        b=N13fLyo0rncMsFBFf3B67nAwRYiHAXQSKZi8QXLCG5JyKIp3+RKM6fUaGWKt23vvY2
         dWonYF5jh+x+3XSgZiJ7+23FmA+5WgYu1B8k0Pobdnwq8/upohWo/DucLoMXjNfNoPYX
         /ALXPn9UjX7fAgLBnkkTmKtKlwLb2v3AH5ey2QQNgeHteemaXjUeQirm0d+PFxsPfCDO
         t0rfbhZTWPNyCAVD6dC8bWLirgLDcuAXtrequHeapKQvxi46tH8DBLKlecSb8CHyg97D
         OBJvQRSEXAlwYNLQED459A88S/F8N2w1HJ0r/R2ZKr0eGWgQ+r1WC9zBKO+nzakCGvC+
         r9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698117; x=1706302917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jG9+AFkJLNvflocjNZF15QhqO4HCzitJO63mbz/u+8=;
        b=iAmlVEdo5zRC6dLD/YBmD2kTqLcvISnMbESvjSodLa7ylaWiuVcXdD93OfOv6SqS6X
         zBkN4vm0kLS1JAjEEZGDAG93JiQPI4Ni4qPfqRGytB4cII6Vn7GMJ+ysMpesgEBwSmn0
         STlbv3HvkAn6yyRUorvJJ9CtF2I2P7i87bAypfJExMKPiFEQWsjoYxnd8LZyK2ydtNh8
         3P06l2BQUBAg0VIqLI2rw419sX4zCEK3foGEmFbPXDBrpRGm+V4kUqgKAxIiDIZ2/l8Y
         KuoIYAhSnIZnh9wySz2R/6qRc/8AzAnYedzdaD3SRnuf1cqt6PQ6u+hK/vdU+U+WIdVo
         ci9Q==
X-Gm-Message-State: AOJu0YwdDzJ4ewCUJux9X317PI6lqRmLP4TMdrxFF/ToVfHM3l/2XE/u
	tDsTkWetHw9gTvwW6+uSVN3KM7iAfK9zaGT7hpk+6ZZQI8f8vcHm24RYnxSViJs=
X-Google-Smtp-Source: AGHT+IGNR5BYN2HXGSPs+VQNSYhLsM/2O6+KOSvuCAHGwqfjFw0UVx1cafcplfBPWtjgF8KdjNjiqg==
X-Received: by 2002:a92:c549:0:b0:360:7937:6f7 with SMTP id a9-20020a92c549000000b00360793706f7mr952902ilj.3.1705698117134;
        Fri, 19 Jan 2024 13:01:57 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id j29-20020a056e02219d00b00361a1b951f7sm1023250ila.86.2024.01.19.13.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 13:01:56 -0800 (PST)
Message-ID: <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
Date: Fri, 19 Jan 2024 14:01:55 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: no console on current -git
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: avier Martinez Canillas <javierm@redhat.com>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
References: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
 <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/24 1:55 PM, Helge Deller wrote:
> Adding Mirsad Todorovac (who reported a similar issue).
> 
> On 1/19/24 19:39, Jens Axboe wrote:
>> My trusty R7525 test box is failing to show a console, or in fact anything,
>> on current -git. There's no output after:
>>
>> Loading Linux 6.7.0+ ...
>> Loading initial ramdisk ...
>>
>> and I don't get a console up. I went through the bisection pain and
>> found this was the culprit:
>>
>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>
>>      firmware/sysfb: Clear screen_info state after consuming it
>>
>> Reverting this commit, and everything is fine. Looking at dmesg with a
>> buggy kernel, I get no frame or fb messages. On a good kernel, it looks
>> ilke this:
>>
>> [    1.416486] efifb: probing for efifb
>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 3072k
>> [    1.416605] efifb: mode is 1024x768x32, linelength=4096, pages=1
>> [    1.416607] efifb: scrolling: redraw
>> [    1.416608] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>> [    1.449746] fb0: EFI VGA frame buffer device
>>
>> Happy to test a fix, or barring that, can someone just revert this
>> commit please?
> 
> I've temporarily added a revert patch into the fbdev for-next tree for now,
> so people should not face the issue in the for-next series:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next
> I'd like to wait for Thomas to return on monday to check the issue
> as there are some other upcoming patches in this area from him.

Given the issue (and that I'm not the only one reporting it), can we
please just get that pushed so it'll make -rc1? It can always get
re-introduced in a fixed fashion. I don't run -next here, I rely on
mainline working for my testing.

-- 
Jens Axboe

