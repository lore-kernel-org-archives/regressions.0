Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6542E3E8
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBH0MDn3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cfabcbda7bso26465365ad.0
        for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701177753; x=1701782553; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30VypmY2CFZ8lvqagGC6jaet2OpETydP+u6D3TSu8fI=;
        b=dBH0MDn3dwnUsMWwgKMD2MIwyNtBLeAjjqxAwV7BITOnyBkz48nnjqz2k9+qa0tFPH
         uxnrGfXr1GW/b0ZFzHosaSbLzfJbck1ayUs6YjMMDVmHSM3U0pV6/wjvqrTk2I1IK6ib
         M74U/NpIJnNdXFbXTEdKHpCvjAo6xojV6JHpzE3VlcWNnJQngp6RXhUNQb83nOf1/6G8
         r3BIh27sH3qA0nweC7SZv54Qj7Fkz4bPn1I3GFAUt50Cp59sFk3smwesBonfwjg0xy5S
         DSCyIzrxp8HxFgjW8DDIJjR9nVjNO/4jAs0Z8QGbG30Zdp2iakv/htJqqJNdN+0od8PD
         bNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177754; x=1701782554;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30VypmY2CFZ8lvqagGC6jaet2OpETydP+u6D3TSu8fI=;
        b=r2me9zU0a1NV8RweHDmeH+E1mECXnvxKJDOJl55nLVjZvJRdhG86684882sXzmo/j/
         6q92kFpr/mLGIBfQVesULQB6kn8+fbOMvBVmpTRIJGUTXC6h1+eB9boG+Dx45Dz/aDxn
         RWdXoVryb+8tS0Vf9Fw9wLWxFa5nXUtKsnxah8K+DqjUP1wHQLelGuPQwDjfio8opC3N
         tLYd71KmaXekcTRFr7yplJnnh3Ttmv/0osLrKRFc6SsPSKUoFZSpr2lLAonWk0zpKf/l
         nnSSroZQeJGWW6hpXou2EaX6LJR0Kf5i9rGP1HhyxKO0+6yvJQqLa7AR8DsmoDC4f0ce
         XAuA==
X-Gm-Message-State: AOJu0YyubENc7rXoTEHo62rmqadrv3s6Nzgp3vQWxDiO6xJoDUU5nJbM
	aWVrfbvQfzGc/LMxbEYuXBA=
X-Google-Smtp-Source: AGHT+IH3JFeDBdC18l8j/Q+NB48Ja1KZVkzEIv229wi7jf8qWZFdPd/OFYbLqFjShGbgQBekqvZ+4w==
X-Received: by 2002:a17:902:ead2:b0:1cf:a53f:200f with SMTP id p18-20020a170902ead200b001cfa53f200fmr16674842pld.32.1701177753559;
        Tue, 28 Nov 2023 05:22:33 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e5cb00b001cfbd011ca9sm5767276plf.113.2023.11.28.05.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 05:22:33 -0800 (PST)
Message-ID: <01df8329-06d7-4fd1-9c7a-05296f33231e@gmail.com>
Date: Tue, 28 Nov 2023 20:22:27 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Power Management <linux-pm@vger.kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Ramses VdP <ramses@well-founded.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Intel hybrid CPU scheduler always prefers E cores
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I come across an interesting bug report on Bugzilla [1]. The reporter
wrote:

> I am running an intel alder lake system (Core i7-1260P), with a mix of P and E cores.
> 
> Since Linux 6.6, and also on the current 6.7 RC, the scheduler seems to have a strong preference for the E cores, and single threaded workloads are consistently scheduled on one of the E cores.
> 
> With Linux 6.4 and before, when I ran a single threaded CPU-bound process, it was scheduled on a P core. With 6.5, it seems that the choice of P or E seemed rather random.
> 
> I tested these by running "stress" with different amounts of threads. With a single thread on Linux 6.6 and 6.7, I always have an E core at 100% and no load on the P cores. Starting from 3 threads I get some load on the P cores as well, but the E cores stay more heavily loaded.
> With "taskset" I can force a process to run on a P core, but clearly it's not very practical to have to do CPU scheduling manually.
> 
> This severely affects single-threaded performance of my CPU since the E cores are considerably slower. Several of my workflows are now a lot slower due to them being single-threaded and heavily CPU-bound and being scheduled on E cores whereas they would run on P cores before.
> 
> I am not sure what the exact desired behaviour is here, to balance power consumption and performance, but currently my P cores are barely used for single-threaded workloads.
> 
> Is this intended behaviour or is this indeed a regression? Or is there perhaps any configuration that I should have done from my side? Is there any further info that I can provide to help you figure out what's going on?

PM and scheduler people, is this a regression or works as intended?

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218195

-- 
An old man doll... just what I always wanted! - Clara
