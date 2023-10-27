Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E1417990
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="OdkEnxxh"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7a94c5489a4so831939f.0
        for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1698417963; x=1699022763; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3WKPOInrEdvQkvpwxwv5Fja/uHzd3UARsSrjsxhvxA=;
        b=OdkEnxxhEUFnFjsvo4xzdaiVfP+PffuZ8AbmYjngx067FKJP5SzlIviDrjk5P0qRUR
         Pbt9iP9lt4HrYt8U9Pmzo+6pHMsT0kUYBKBqjOP0kY2AOn+8iNQcO+MeqCLh9JS5v593
         mRLE+L3RbYfch6oYlYUndhKKTR2tzLcgP7INS8wQnGLt5zxFtjJ10ejczYEolm4a7CT2
         tg5ZELbnR19dlcZBez/V58dwrxDaAhvxR/3DI6ahw3uWje9+Z80GaeuqXv2xz7VBvVLQ
         qUde5wGmBpYvWyDm+HeU7Zcfrks92KEXRQy3nZ542kEQ8QbbAEVFmo8ZGveR+RalBucG
         g4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698417963; x=1699022763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3WKPOInrEdvQkvpwxwv5Fja/uHzd3UARsSrjsxhvxA=;
        b=C1ggf2DeuvPyWU9Phpf4m59JPdaSzQsSrDojHTMT9gtSjoXKnr2QASLEVO2iON4L06
         c0OP8Ps6+2G7LGqEUtvAFV48onul2Kp0SfZtFqLqTVMGPqKXu30EfwwoUMY39UKGGweB
         f/JgLymxiTJoB/doE5YBv1kfsQfY2vhxFTfhjtH9xC/sSvUYnPBTgzqRM/rmR2tgFVxR
         DpH5fXORq/5rstxhp0PSj8IZofRGaobssKVJtEWSN6xXKHWLXd7iCPMxBq7CYTNm8WYN
         JFoB279XxFF5DFL8ztVfcPBikYx+Su47j7uQHZRbpxfE7WRSYTKYJOoZp04pcXlq2S03
         qH9A==
X-Gm-Message-State: AOJu0YyGMoVm+dPkXu1B+zmoqr85lfGYI6iKBx245H+KI4hp8xQ8Zbra
	wPUTb/Ez+FRY07grOoIocmggSw==
X-Google-Smtp-Source: AGHT+IHmCzlqOlY3EomSO6T6RBCPoJ56NrwN0Ratf4Xmk5f2jtUUYWADjfWiLvNvMD7NWy9RJpRVLw==
X-Received: by 2002:a6b:500a:0:b0:792:6068:dcc8 with SMTP id e10-20020a6b500a000000b007926068dcc8mr3504618iob.2.1698417962713;
        Fri, 27 Oct 2023 07:46:02 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id h5-20020a0566380f0500b00452a3ffe215sm439470jas.87.2023.10.27.07.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 07:46:01 -0700 (PDT)
Message-ID: <84a42959-e15f-4128-ae2f-df9650879556@kernel.dk>
Date: Fri, 27 Oct 2023 08:46:00 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: task hung in ext4_fallocate #2
Content-Language: en-US
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andres Freund <andres@anarazel.de>, Dave Chinner <david@fromorbit.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Shreeya Patel <shreeya.patel@collabora.com>, linux-ext4@vger.kernel.org,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 gustavo.padovan@collabora.com, zsm@google.com, garrick@google.com,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 io-uring@vger.kernel.org
References: <20231017033725.r6pfo5a4ayqisct7@awork3.anarazel.de>
 <20231018004335.GA593012@mit.edu>
 <20231018025009.ulkykpefwdgpfvzf@awork3.anarazel.de>
 <ZTcZ9+n+jX6UDrgd@dread.disaster.area>
 <74921cba-6237-4303-bb4c-baa22aaf497b@kernel.dk>
 <ab4f311b-9700-4d3d-8f2e-09ccbcfb3df5@kernel.dk>
 <ZThcATP9zOoxb4Ec@dread.disaster.area>
 <4ace2109-3d05-4ca0-b582-f7b8db88a0ca@kernel.dk>
 <20231025153135.kfnldzle3rglmfvp@awork3.anarazel.de>
 <b5578447-81f6-4207-b83d-812da7c981a5@kernel.dk>
 <20231025195539.GA2897448@mit.edu>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20231025195539.GA2897448@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/23 1:55 PM, Theodore Ts'o wrote:
> On Wed, Oct 25, 2023 at 09:36:01AM -0600, Jens Axboe wrote:
>>
>> FWIW, I wrote a small test case which does seem to trigger it very fast,
>> as expected:
> 
> Great!  I was about to ask if we had an easy reproducer.  Any chance
> you can package this up as an test in xfstests?  Or would you like
> some help with that?

I think it's good to convert to a test case as-is, would just need to
loop X iterations or something rather than go forever. If you want to
run with it, please do!

-- 
Jens Axboe

