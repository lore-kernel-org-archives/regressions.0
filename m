Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9515E32C64
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Jymk1qwq"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3593d2018bfso5662145ab.0
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 09:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699464414; x=1700069214; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHvbjRtHT490XyVmOfv7iCqXetw+QsUF5nJ+m2Yp3UU=;
        b=Jymk1qwqwqPnkMNn9hM6bAtnsV4glHniCb3edeGX+zeGJ0b9BuDtAVC+TP6hmcPOkJ
         Rgv2+P22NlLKBBa3JpzUwDHMjDZXKu1+T7n6hIo0rgA4Pu1nhb2VQifGCOPafvOvTQQP
         eK6Ang5KR6j7D2djQoRbE4QfBVSoWwK+EVLvfMuxElnJtv9Punp5CTqLy0SQw5CpTrjZ
         HrAu10y+YZSvUagmBJvBSu4GZQeoxFIIOCzMLYuGiXwI4ryJSwPx3Hdeicz+t1e4Zljk
         Uj3v2c+eOVtrytcmPj+yAmcbg3Zi6PSZPdLqWGTC3LJFZ0piVIuaYlJXIibDXERbvxG3
         kBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699464414; x=1700069214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHvbjRtHT490XyVmOfv7iCqXetw+QsUF5nJ+m2Yp3UU=;
        b=oAXyL9Y9j8qwc20KX7Ap0ckFoBIFJgQmI3S+pOH5206pMfT0V9zNEaSp5l3uu1/u4A
         xIsoZ7TpbhPuOPFgGyHHPAh5J1B3fWLOooDMpI5UBfaitnuHvXdu2o61YEzX2TwJYJJC
         wi8s3ZMbuXxrVFMjeLYzzK6Aqvky687FBAwVz3co6Eg2k6hzV9rPfozrBiyE4JigFxkX
         8/3PVyJOKyvBw2fLkBZ1PiH4xu8bBvM7Mva8mIGdftD7AwlYETi6b8Qlp+2tiFxem/W1
         MOdId2abA42lK857XQSzln2jZJ0/tWWKfA3WZ900l9kJxOWAvnJd798hXnvAw28kWlbo
         +t4w==
X-Gm-Message-State: AOJu0Yx2z7JnUSBT1e8NliCV04MCspKHEa2t79QG19Q1LSZdRSOvmAkc
	NNMsm0oX8OtOu0KA6oAaO4IXNQ==
X-Google-Smtp-Source: AGHT+IFjdvnuc1V44ayjdc6GE3fvR59dJe+uCwLRaJMKWGSNryZEBEaDApCIPYX2HCCM2b28pzCpKA==
X-Received: by 2002:a5d:8716:0:b0:7a9:7aa9:c175 with SMTP id u22-20020a5d8716000000b007a97aa9c175mr2195142iom.1.1699464414637;
        Wed, 08 Nov 2023 09:26:54 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id q23-20020a5ea617000000b007a94c54b7basm3538987ioi.34.2023.11.08.09.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 09:26:54 -0800 (PST)
Message-ID: <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
Date: Wed, 8 Nov 2023 10:26:53 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com>
 <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk>
 <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com>
 <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk>
 <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com>
 <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk>
 <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk>
 <479322567.45813366.1699463423245.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <479322567.45813366.1699463423245.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 10:10 AM, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Wednesday, November 8, 2023 9:14:55 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/8/23 8:10 AM, Jens Axboe wrote:
>>> It could also be a task that has pending IO and is doing exec() (and
>>> friends), this would also cancel inflight IO.
>>
>> If this is the case, then you could try with this one to just disable
>> that and see if the corruption goes away:
> 
> Unfortunately that had no effect on the corruption.  I've also traced
> the signal generation into the get_signal() call, which is apparently
> sending SIGKILL when the thread group is marked for termination --
> this is in turn why the PID fields etc. are all zero.

That's good news though, because I'm continually pondering why powerpc
is different here.

> Investigation continues.

If it's not exec, then it has to be a signal. I'm assuming you're
hitting this in get_signal():

		/* Has this task already been marked for death? */
		if ((signal->flags & SIGNAL_GROUP_EXIT) ||
		     signal->group_exec_task) {
			clear_siginfo(&ksig->info);
			ksig->info.si_signo = signr = SIGKILL;
			sigdelset(&current->pending.signal, SIGKILL);
			trace_signal_deliver(SIGKILL, SEND_SIG_NOINFO,
				&sighand->action[SIGKILL - 1]);
			recalc_sigpending();
			goto fatal;
		}

which is either exec (which we verified it is not), so I don't see
anything other than this being a signal sent to mtr/mariadb for exit.

Does this trigger? Doesn't necessarily indicate a bug as it would be
valid, but if it does trigger, perhaps io-wq has unstarted requests at
this point and they get canceled and hence never written. If this does
trigger, maybe try and do your sleep trick there too and see if that
gets rid of it.


diff --git a/kernel/exit.c b/kernel/exit.c
index ee9f43bed49a..53e4c3324672 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -1011,6 +1013,8 @@ do_group_exit(int exit_code)
 		else if (sig->group_exec_task)
 			exit_code = 0;
 		else {
+			if (current->io_uring)
+				WARN_ON(!strncmp(current->comm, "mariadbd", 8));
 			sig->group_exit_code = exit_code;
 			sig->flags = SIGNAL_GROUP_EXIT;
 			zap_other_threads(current);

-- 
Jens Axboe

