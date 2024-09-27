Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9121C0DFD
	for <regressions@lists.linux.dev>; Fri, 27 Sep 2024 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727449108; cv=none; b=CcQePjyN6gt5KOaV4sdvIk9Bc12EX9CEyl7/TJY10aBtAIIEKFx2qvo+Sg2gyM+LpDGH+8Mn6BZlI7EG3XIfibs0OFQKftKQ08z8F9p8xJfbgz4I4MaBrJy4yLBOmn9zfoXVnGMeHbBf62psIq3P3hrBQk2XQk6lCB1sCAGgEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727449108; c=relaxed/simple;
	bh=gz5kgzblFEgVvHMM1++lDHMe6JbnFl7PORGLYZgFors=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuIhRgG78w/j864pZucPZTWuc8jbpC2AP9i1JLSPCB9Hz7cpHivGTYrcyRm9TCmj5m6lvvINVzpRKxkzy6CXnlBXZMKOwuiewytP5K2N5byPTjDTvUYYuPHWWHjAo5+WA2E1iXkIUHELCEudTlqrfRMjnz/d1xNNlTPkGNPms4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=EtaYo73t; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="EtaYo73t"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a27599274eso8054095ab.0
        for <regressions@lists.linux.dev>; Fri, 27 Sep 2024 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1727449106; x=1728053906; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozhasy6P2Xb1oYh5TEGfoMTGpcm94OU26cK0RFvw/pA=;
        b=EtaYo73tQQLRlSM6pN1HS1aPHU6J49QTb785ig9asrYb1BjC/sWDo/lqpHPNJ4+QNf
         bwR7Gt0OstBFBKd+361J0sRf9Mc9++8LxJ5Nz+m4BOCsVQZNyZh9L8Lp4yFbA4sWbamt
         JV1zXQ9diT929je64GN4BSShkcIfWtOHJ8m7mXk6O7fUCgtr8MqUKWcVIerkECFSg4zX
         icEzl+x3Ix+FhkGbSb803V4MBgwTUAGX31I0ksJhQoqURktOnIiIkwBK4i3G8syaNkfh
         rIODZ8sHCgfsRvASlzZ3J062u+52VLRbxRQoJMZuBrILSX1+3GNQm/rvwuoeOHJv7q9t
         bIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727449106; x=1728053906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozhasy6P2Xb1oYh5TEGfoMTGpcm94OU26cK0RFvw/pA=;
        b=nZUiY/82PTpOIBKdRdLvWlfO+Oji7mYPg3jGwyf1jpEnQtkNPEiS1bWmFlfygI3UQv
         y03r097UyRPOl7gcBg57fR+putD1S5igEmN6TwE/JoLCYrH/tdSS++eLxyPqruuiOIh4
         QbGGNdomD54YFKIFg96ItCjFxxWh6hjZmX9pTtSgibnoxVTHK9cNX5XTgjT2p1O/L1ZM
         yuVdFFNcDMsrjD2RU0H1JA86MHD9ypTs00+JHbVx5L1RAGT59D4gS16Iq/k3Jlvl9QD8
         OUf1R6097ZpVJ/MV/UkyWkJpAQVww1jcwg06pwYqh7KEGy7rrQZUUNdeyLCOVKCV8Y3M
         bd+A==
X-Forwarded-Encrypted: i=1; AJvYcCV5aFt7iiGI/ech+2XnXcDREY1ulHEhWm4pHpbzzEVnM3VKltQc508DBKVP31pqQ2My77n2Psh++9Ckcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyivA4mFa7lJW+r3k+XwrxKptGyqp2RFKKtSaXKqhS4uT9DlD+
	VE/1DIwFg4IkmO9p7AyuiYLFxaqVhOv+Eq0VNqFvudV3auTL+qBi9Ku6hEUNSXY=
X-Google-Smtp-Source: AGHT+IH8vraAyss5dfiMI4UgXMfkbfey2C1HTqAO3BTHkbK/0W8GSVWuzGv0+TFXbW2pP7mY0lBEFA==
X-Received: by 2002:a05:6e02:1fe7:b0:3a2:e9ff:255a with SMTP id e9e14a558f8ab-3a3451b4b6emr32273115ab.22.1727449105798;
        Fri, 27 Sep 2024 07:58:25 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344d81fa4sm6237075ab.20.2024.09.27.07.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 07:58:25 -0700 (PDT)
Message-ID: <0bdce668-5711-4315-ab05-1a3492cb8bf6@kernel.dk>
Date: Fri, 27 Sep 2024 08:58:24 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Sam James <sam@gentoo.org>, Kairui Song <ryncsn@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stable@kernel.org, clm@meta.com, Matthew Wilcox <willy@infradead.org>,
 ct@flyingcircus.io, david@fromorbit.com, dqminh@cloudflare.com,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-xfs@vger.kernel.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, torvalds@linux-foundation.org
References: <0a3b09db-23e8-4a06-85f8-a0d7bbc3228b@meta.com>
 <87plotvuo1.fsf@gentoo.org>
 <CAMgjq7A3uRcr5VzPYo-hvM91fT+01tB-D3HPvk6_wcx3pq+m+Q@mail.gmail.com>
 <87y13dtaih.fsf@gentoo.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87y13dtaih.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/27/24 8:51 AM, Sam James wrote:
> Kairui Song <ryncsn@gmail.com> writes:
> 
>> On Wed, Sep 25, 2024 at 1:16?AM Sam James <sam@gentoo.org> wrote:
>>>
>>> Kairui, could you send them to the stable ML to be queued if Willy is
>>> fine with it?
>>>
>>
>> Hi Sam,
> 
> Hi Kairui,
> 
>>
>> Thanks for adding me to the discussion.
>>
>> Yes I'd like to, just not sure if people are still testing and
>> checking the commits.
>>
>> And I haven't sent seperate fix just for stable fix before, so can
>> anyone teach me, should I send only two patches for a minimal change,
>> or send a whole series (with some minor clean up patch as dependency)
>> for minimal conflicts? Or the stable team can just pick these up?
> 
> Please see https://www.kernel.org/doc/html/v6.11/process/stable-kernel-rules.html.
> 
> If Option 2 can't work (because of conflicts), please follow Option 3
> (https://www.kernel.org/doc/html/v6.11/process/stable-kernel-rules.html#option-3).
> 
> Just explain the background and link to this thread in a cover letter
> and mention it's your first time. Greg didn't bite me when I fumbled my
> way around it :)
> 
> (greg, please correct me if I'm talking rubbish)

It needs two cherry picks, one of them won't pick cleanly. So I suggest
whoever submits this to stable does:

1) Cherry pick the two commits, fixup the simple issue with one of them.
   I forget what it was since it's been a week and a half since I did
   it, but it's trivial to fixup.

   Don't forget to add the "commit XXX upstream" to the commit message.

2) Test that it compiles and boots and send an email to
   stable@vger.kernel.org with the patches attached and CC the folks in
   this thread, to help spot if there are mistakes.

and that should be it. Worst case, we'll need a few different patches
since this affects anything back to 5.19, and each currently maintained
stable kernel version will need it.

-- 
Jens Axboe
