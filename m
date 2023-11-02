Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24C6AB0
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UejARonB"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5872b8323faso322878eaf.1
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 00:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698911476; x=1699516276; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PrAs2Tc99o3KGDiQSF+aKrZ+y8qL8PDxem+N4SUKa0=;
        b=UejARonBgx9QqFC62HtUIXlZvnvv2OBviI6sWOveR3vtJF+o1ryW588TUVnsUEV2ay
         YOkcJOFeb9OJUwQOem6YmTq9IM70ZhcNrl04vkU6AJTIsxJi1nVT5HzaP8Iy+aiIjJ4Z
         Gr/5QB0MZDP1WhANjqacrGxCf+hQqu3iGRoitIC1KsfqWH8Xc9kZP7RsffPTbk+1/eco
         2hIC8GXblWf3VecEkGnZI9r5diwcOaL7MVo7WBFn5ofOciZA/xXDvWGYy2Zn034Qfd4J
         cSy7/sLTyePLV/3n6eEk1YNgWZWYieIjTTmZe8iSL8hHB9JrVd0uPg4K+7pP/WziCJxV
         OUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698911476; x=1699516276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PrAs2Tc99o3KGDiQSF+aKrZ+y8qL8PDxem+N4SUKa0=;
        b=q5B94kH9B1iyzrWD/YYTHIIdSNyXR8aV/O5d5cVtlaJo3ospw8f/aBTFMGWzEeouLV
         2dqsadTaso3jEfqs9Z2tY3E9kOxtCjtZTzXIu1rkmlyrUFMP8scmjlWyvBCmK9n/DRq0
         GIfR7yivG+bNABMpLEmv64TOIVtmfXKWxoGAAO+x6fEaUdXd7xTfZvKFclgn5FGr4k2N
         vmVJAfeQYzUT4JbPsQ1eNaADYhWlpU7IvJ9zBKKjDPuMbY9VIB/HqkywjG0tMg2BHBeM
         PYbnqv6tUNWaJqE3S22+ianOnTsg80GSzWseiwHwCVcCVtAvsXiIy5kLfGhOrZypV2ra
         sfMQ==
X-Gm-Message-State: AOJu0YykeZDJr/PugCSdObWwq+aZGPYIEvO+TNgTRS2FskajGEKCVfK2
	NofpN+0o0L26yy8/Nal0pzbxLXMxWCM=
X-Google-Smtp-Source: AGHT+IEWAs69KuY7cTMb7hRnkK3qdDBXgD0tDxLUGUOPZMC+cBH1Oxifx11JAVnBW7QBLliKSdA5YA==
X-Received: by 2002:a05:6358:7f0f:b0:16b:406c:a002 with SMTP id p15-20020a0563587f0f00b0016b406ca002mr227655rwn.19.1698911476055;
        Thu, 02 Nov 2023 00:51:16 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id w29-20020a63935d000000b0059d219cb359sm935259pgm.9.2023.11.02.00.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 00:51:14 -0700 (PDT)
Message-ID: <557f1553-4e85-4988-83e4-c07acaccfd1e@gmail.com>
Date: Thu, 2 Nov 2023 14:51:05 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel
 issue
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jkosina@suse.cz>, David Revoy <davidrevoy@protonmail.com>
Cc: "jason.gerecke@wacom.com" <jason.gerecke@wacom.com>,
 "jose.exposito89@gmail.com" <jose.exposito89@gmail.com>,
 "ilya.ostapyshyn@gmail.com" <ilya.ostapyshyn@gmail.com>,
 Nils Fuhler <nils@nilsfuhler.de>, Ping Cheng <ping.cheng@wacom.com>,
 Peter Hutterer <peter.hutterer@who-t.net>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Input Devices <linux-input@vger.kernel.org>
References: <kRKTNDYigUSblpNgSuZ2H4dX03Of1yD4j_L9GgbyKXcDqZ67yh5HOQfcd7_83U3jZuQzxpKT3L6FXcRkkZIGdl_-PQF14oIB0QmRSfvpc2k=@protonmail.com>
 <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <ZULw6AcBaD6z2UZA@debian.me>
 <ba7aeb6b-19ee-4491-a60f-efc5216177a7@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ba7aeb6b-19ee-4491-a60f-efc5216177a7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2023 13:31, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 02.11.23 01:44, Bagas Sanjaya wrote:
>> On Wed, Nov 01, 2023 at 08:37:40PM +0100, Jiri Kosina wrote:
>>> On Wed, 1 Nov 2023, David Revoy wrote:
>>>
>>>> Hi Jason Gerecke, José Expósito, Jiri Kosina and Illia Ostapyshyn,
>>>>
>>>> I am emailing to draw your attention and expertise to a problem I had 
>>>> earlier this week with my Xp-Pen Artist 24 Pro display tablet under 
>>>> Fedora Linux 38 KDE after a kernel update.
>>>>
>> […]
> 
>>>> Thank you very much if you can help me.
>> […]
>> Thanks for the report.
>>
>> David, can you resend the regression report as plain text email (preferably
>> with 276e14e6c3 people and regressions@lists.linux.dev Cc'ed)? You may need to
>> see kernel documentation [1] for how to configure your email client to send
>> plain text emails. Also, include in your report details from your blog post.
> 
> Bagas, I know you mean well, but I think you are making things
> unnecessarily complicated for both David and the developers here. Sure,
> the mail Jiri quoted did not make it to lore, but whatever, for him it
> was apparently good enough; and I suspect this "quote forwarding to
> others" is good enough for the people he brought into the loop as well.
> Yes, there are developers that don't want to go to a website for
> details, but if that's the case it's likely better to ask for details in
> this thread instead of opening a second one. And regression tracking can
> work without a separate mail as well.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

