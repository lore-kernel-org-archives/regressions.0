Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA526E33
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 14:46:45 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1dd0526b5easo4430417fac.2
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695826004; x=1696430804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omvtnjTwFHylSUcgBWmwKr5GCWh6LMXMvDjr47nbvvk=;
        b=avmHt7JLHhJxGRZHdEg0FdOsFKMUrUY7epqpdeSDWGMTBuRr9Aa34Rs1RUA6USCDrw
         TQxbmgLPsb7pdvrAtxgVnE3PKUy7iZ5SE78g4K+krqPOyo6qDxGfstW9OrNST6sjrTN9
         VhxjIb/SPQ6vbAaB1uErWZ+bbrDTnw4zMlO94zIIkooGDV8Z/Ti6gF9hYTDl9HCTTs+b
         ACdqh2Ztad4VlU8CRmUn+mUGhasbrId7OZ/eONs7vfkdx7b7kuDxXDfzB/0cBQpKllDt
         AXGe7iV369auXFBzoLiTHt2Nv9f5i43xGYcNh/aFFj6L5bFVEAJYEFzG+F+P/WacK/3D
         FKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695826004; x=1696430804;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omvtnjTwFHylSUcgBWmwKr5GCWh6LMXMvDjr47nbvvk=;
        b=VyGhmpS4mwRZLToupjI1tqZ72tt8LjCujbJylMP1YnIoKvvbhvsHkKqrBppafu2Cdt
         pwvDvm+a+UPberUZfvwy8IP6/Px5gnnJqsixvFOqWd3zkKQvtzzh3LgCHt64sIVGotcp
         mcCx14CYuC4BJcW626RM+BXASsDGD/HK0yPNHvYiJrIUPwLUzGgZ2YS2hi+L0ztICJfW
         ObwpygL9Qk8hv/cR0+0yoRaZUvEbs1yJNeAPBDTEX2cYq+3zLkquf4mu9RoHf5s7Z6LT
         9fr9/pCNVN6mnu+3+fMQ0Gilk4/s4j7XQW+B6yetQ4VqHnfYLL9HJZbf56Y0KfM25nVf
         kGEA==
X-Gm-Message-State: AOJu0YzL+TgvDDdWouVqkTW8kqvlW/dKf8VSow1wVQumgDDkUZB5yF7Q
	Xt/oYjMfy+4Wrh7uxwsGcy3TtA==
X-Google-Smtp-Source: AGHT+IHwYkpmbFepwSLDv2uPO9OKeAgL+ivoUoYAKRJCFBr93pX2WXP/GXBdmbXlUVvxawzKB7sIog==
X-Received: by 2002:a05:6870:c195:b0:1d5:da78:5c7d with SMTP id h21-20020a056870c19500b001d5da785c7dmr2849559oad.50.1695826004322;
        Wed, 27 Sep 2023 07:46:44 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l3-20020a639843000000b00581d45a5ac3sm2218024pgo.84.2023.09.27.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:46:43 -0700 (PDT)
Date: Wed, 27 Sep 2023 07:46:43 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Sep 2023 07:46:25 PDT (-0700)
Subject:     Re: [PATCH] riscv: signal: fix sigaltstack frame size checking
In-Reply-To: <f30a4d64-c265-4f6a-94bb-632b1c07f15f@leemhuis.info>
CC: linux-riscv@lists.infradead.org, andy.chiu@sifive.com, greentime.hu@sifive.com,
  bjorn@kernel.org, prashanthsw@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, heiko@sntech.de, Conor Dooley <conor.dooley@microchip.com>,
  vincent.chen@sifive.com, mathis.salmen@matsal.de, guoren@kernel.org, abrestic@rivosinc.com,
  Vineet Gupta <vineetg@rivosinc.com>, regressions@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: regressions@leemhuis.info
Message-ID: <mhng-7799d3a1-c12a-48e9-bb5f-e0a596892d78@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 25 Sep 2023 03:07:47 PDT (-0700), regressions@leemhuis.info wrote:
> On 31.08.23 23:58, Palmer Dabbelt wrote:
>>
>> On Tue, 22 Aug 2023 16:49:03 +0000, Andy Chiu wrote:
>>> The alternative stack checking in get_sigframe introduced by the Vector
>>> support is not needed and has a problem. It is not needed as we have
>>> already validate it at the beginning of the function if we are already
>>> on an altstack. If not, the size of an altstack is always validated at
>>> its allocation stage with sigaltstack_size_valid().
>>>
>>> Besides, we must only regard the size of an altstack if the handler of a
>>> signal is registered with SA_ONSTACK. So, blindly checking overflow of
>>> an altstack if sas_ss_size not equals to zero will check against wrong
>>> signal handlers if only a subset of signals are registered with
>>> SA_ONSTACK.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] riscv: signal: fix sigaltstack frame size checking
>>       https://git.kernel.org/palmer/c/d77303a57c95
>
> Just wondering: what happened to this patch, which afaics is currently
> in neither mainline nor next? Because according to
> https://bugzilla.kernel.org/show_bug.cgi?id=217923 it fixes rustc
> userspace crashes with 6.5. Was a different approach found?

We talked about this in the patchwork meeting.  I think I just dropped 
the ball somewhere -- we moved offices and then I was at the cauldron, 
so things are a bit more hectic than usual.

I got back last night and I'm still a bit out of it.  I'm going to try 
and dig whatever computer I was using out of a moving box and find the 
actual commit, as I'm kind of worried I might have lost something else 
as well.  Might not be super fast, though, as I've got stuff all over 
the place and I'm pretty much falling asleep already...

>
> Ciao, Thorsten
