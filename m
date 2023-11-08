Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6D32C63
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="eae8e4rW"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-35904093540so9809855ab.1
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699465749; x=1700070549; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCFe0zXtZZcOgsGEHZhCllSzRv0z8KhFX1dWvCd8WLY=;
        b=eae8e4rW6gXTcSs3Zia4DgvOGBOQ+V5MREdflG1hYhr5nq9RaT57H9+0aoDKDWb3+y
         /N8LEAXNmxJDasKvQfybHWw4/I1oUrmdLecsO9/qEAfjkMu3v0kSDkCnPDpoGd70RjSA
         NTvPSpvChEtCcLDzbOUV7SSE9iyoSwtuLFyK4ewfDLRTHeh32alSsqO09j81A58vj9RW
         3Wj85qwoub4lAy3iiXlDdimrzvzZn2dcdHHoWNensu/BQPh6Rt7h1wjCNV4wpWyZ6mYT
         1afn4ZPb0VdkHxhe+p6feJYvjlnr2zbsPE6mrsu6TUMoP6F1VQxongGpoJ4EDG2wgHoh
         uJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699465749; x=1700070549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCFe0zXtZZcOgsGEHZhCllSzRv0z8KhFX1dWvCd8WLY=;
        b=VR+16MV2ccF2hYXfUf3znkI5VnwvlEPuY7EDPD3c/FBWlxYf6zRXwHhTIGrInA5CYU
         Sr8OYgCBL7EjiiIpw452EePe5GDQeikaMZKKaOwQdmJ83IMWfZ2wVFLNKUIwhiGQRJpA
         LBWDEFXsDfD4IlpYcYdVBJoi1nBLVLbmK6AWOfoKgXEjgT+UGDmaniLJngjI8O9e6hlI
         FstteeIjm5s5sOE4G/CvyWGK2cmnHqh288XEIj/7In3/twXufufN9A8/XbO9D3V/l9z1
         3Mk3beBq9oVsr1we0hXy4WOpZ1qyCHAQpDxAQE5mZyCy4tZPO4dLudh2Px4cwAsfvlJE
         j0fA==
X-Gm-Message-State: AOJu0YwuP+L/kZMnA0E9+H/7oIKQ7DPYbb6DWQ91WRd5o4zq/3JGDdaP
	Dc5XMitGU0jDO9ooKuwKsICS36/W/crGZxXmNSQ7kw==
X-Google-Smtp-Source: AGHT+IFFFpH4Nsa85yvQSqCm+L6g9TmgSbQrPuPas2QF0qyogWjM7fFQzsp4jq+UfZ6aoARco2ipEg==
X-Received: by 2002:a05:6602:2e8b:b0:792:6068:dcc8 with SMTP id m11-20020a0566022e8b00b007926068dcc8mr2837062iow.2.1699465749717;
        Wed, 08 Nov 2023 09:49:09 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id n10-20020a056638120a00b0042b1a9f8480sm3291054jas.35.2023.11.08.09.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 09:49:09 -0800 (PST)
Message-ID: <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk>
Date: Wed, 8 Nov 2023 10:49:08 -0700
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
 <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com>
 <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk>
 <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com>
 <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk>
 <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk>
 <479322567.45813366.1699463423245.JavaMail.zimbra@raptorengineeringinc.com>
 <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
 <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 10:40 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Wednesday, November 8, 2023 11:26:53 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/8/23 10:10 AM, Timothy Pearson wrote:
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Wednesday, November 8, 2023 9:14:55 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/8/23 8:10 AM, Jens Axboe wrote:
>>>>> It could also be a task that has pending IO and is doing exec() (and
>>>>> friends), this would also cancel inflight IO.
>>>>
>>>> If this is the case, then you could try with this one to just disable
>>>> that and see if the corruption goes away:
>>>
>>> Unfortunately that had no effect on the corruption.  I've also traced
>>> the signal generation into the get_signal() call, which is apparently
>>> sending SIGKILL when the thread group is marked for termination --
>>> this is in turn why the PID fields etc. are all zero.
>>
>> That's good news though, because I'm continually pondering why powerpc
>> is different here.
>>
>>> Investigation continues.
>>
>> If it's not exec, then it has to be a signal. I'm assuming you're
>> hitting this in get_signal():
>>
>> 		/* Has this task already been marked for death? */
>> 		if ((signal->flags & SIGNAL_GROUP_EXIT) ||
>> 		     signal->group_exec_task) {
>> 			clear_siginfo(&ksig->info);
>> 			ksig->info.si_signo = signr = SIGKILL;
>> 			sigdelset(&current->pending.signal, SIGKILL);
>> 			trace_signal_deliver(SIGKILL, SEND_SIG_NOINFO,
>> 				&sighand->action[SIGKILL - 1]);
>> 			recalc_sigpending();
>> 			goto fatal;
>> 		}
>>
>> which is either exec (which we verified it is not), so I don't see
>> anything other than this being a signal sent to mtr/mariadb for exit.
>>
>> Does this trigger? Doesn't necessarily indicate a bug as it would be
>> valid, but if it does trigger, perhaps io-wq has unstarted requests at
>> this point and they get canceled and hence never written. If this does
>> trigger, maybe try and do your sleep trick there too and see if that
>> gets rid of it.
> 
> Yes, it does indeed trigger.  Is there a way to directly check for the
> unstarted requests?

Let me hack up a debug patch for this, give me a minute.

-- 
Jens Axboe

