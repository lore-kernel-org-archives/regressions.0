Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51059374D7
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a92/09hb"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cfae5ca719so28936335ad.0
        for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 06:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701181164; x=1701785964; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6XhNRARmqH+4x0OwGlgRfFmZJPzHtmJD0IS9paEElc=;
        b=a92/09hbUIt3TZ8ro24OI3ha4vvuvj+0BPC4pPQvTEbwfjUmN2hKCBh7OAkoI7wRQm
         sHCZUmmHZhUj42gRyPgs2R2UmrloOclfNXD17cmlwBQf1lO1vdlt0xBJPEEJTh8Rduw3
         j3qdH+kZWd7UaYqMBQg94CjZ4+nyCnGE9Ne/J/kqNawLZ3M20/FLEcWtXpiAQvNIWaeM
         fP5hQ80KnTytbbm2VNxvu4+93P9faVNNIdU8j2nbwES23tSJ8iSb5QVhtGFlmrZfjWu6
         bI4rAHuZbJfEciKsHyXPeX45mqys/NyzmdF7W4+/BhX6gizHQ7KUyWIEj5PwPsygjr7t
         /+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701181164; x=1701785964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6XhNRARmqH+4x0OwGlgRfFmZJPzHtmJD0IS9paEElc=;
        b=IODzzHGRG6m5SI6Lt+Oi7GupwF8UdTk3ZpmozwZ/C1H09pBTOe7GMy2IGTOdFURCeh
         amtNw5r4u6cahBm7rqh2uMtcTKlPh6VrIapjGbFtftH9+03DHYtHL5fSqB3enjAXoUPf
         3Vah48qDdWPXbvi/zSCRM7MDp2Z+szdahHleGmFMuU66N3LwF8Ytt88li3GfP+sQrHKA
         /rFedOr0ettgwC9I9UbEeBv+lrrNikmvlMcrLebk23n4Eq0rUvE+xKNE85mO/JvnRqh3
         nZ3DwYxbx58jeCnPp6cqhRBNoHeHAcQkKcnje2HYezPUM3dBP375AIAjGSydLFZZPKGK
         3qjg==
X-Gm-Message-State: AOJu0YzhnVzRvVXOruZGdKzwq/gkk3BYSL2lzTrzjrRS9hXIYVBky0WQ
	RRUThqOzmBvSsEeCHHjnajE=
X-Google-Smtp-Source: AGHT+IGeC7mc0cJX07FMHsmska8S2jhN0dx43giDBl3kNLeg0J2yYUNXit5A04Bvwnt0hwj/iQjGxw==
X-Received: by 2002:a17:902:c1d5:b0:1cc:3829:8355 with SMTP id c21-20020a170902c1d500b001cc38298355mr13359009plc.12.1701181164472;
        Tue, 28 Nov 2023 06:19:24 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id k18-20020a170902c41200b001cfaba4bfbdsm7781532plk.83.2023.11.28.06.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:19:24 -0800 (PST)
Message-ID: <9b424bac-b15c-476d-893e-9e6b54de70c3@gmail.com>
Date: Tue, 28 Nov 2023 21:19:18 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Intel hybrid CPU scheduler always prefers E cores
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Ramses VdP <ramses@well-founded.dev>, ricardo.neri-calderon@linux.intel.com
References: <01df8329-06d7-4fd1-9c7a-05296f33231e@gmail.com>
 <20231128140225.GS8262@noisy.programming.kicks-ass.net>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20231128140225.GS8262@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/28/23 21:02, Peter Zijlstra wrote:
> On Tue, Nov 28, 2023 at 08:22:27PM +0700, Bagas Sanjaya wrote:
>> Hi,
>>
>> I come across an interesting bug report on Bugzilla [1]. The reporter
>> wrote:
> 
> Thanks for forwarding, what happend in bugzilla staysi in bugzilla etc..
> 
> Did you perchance Cc the reporter?
> 

Yes, I CC'ed him.

-- 
An old man doll... just what I always wanted! - Clara

