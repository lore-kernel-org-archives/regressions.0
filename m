Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253C7F7F0
	for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708525907; cv=none; b=BFDFPmNv8D2iXi14w00It6TriX22jhXsC59knPIQjQR53+LzJQaAkV/qflbkW6ryl5WAWq4h6/aZ5/+dPSO/x8mHQeGCzMrZkRqJApYXiVm70+tm0fniB7lVJJF19YfV1mtIKLTyf4T0ELIxEHTdHuQZt7f8DN2PJxKJ1CCA/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708525907; c=relaxed/simple;
	bh=mz/A73v9h1qq3OiNSjZ0/QAV8odwwWBDOBmOxhSJ8Gg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EmYCxECDNiZZ+JwF+PPEGhNFOi4jlxutkuvMLf3dDgXcYycsB7leL9nSNi41e3g7ILHgteXtlzWNceGfUu2W0QqxR9kQbcSVP3tOVD4ITxYegGtIxcrqmkDx7CzrI3YaIKVB+eovtkK/3ZyYOTVur0a7mIZz1RB8a+CpHY5qldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gzq/Vxof; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gzq/Vxof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708525904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9inO5+Trhr7gqmLUqHbY08vfN72/KzByM6sTZmmhmQ=;
	b=Gzq/VxofaS7ycFsTJ9TTUBNpQv3CzEj768VZHvtAseulkyfRtXXSXdqA0gs1KCIy6dqEdX
	Iiz+F2Qa3oMGINYK9PadDcJMmNk6T7RAGXFww5unf0wjaa1+uzPkvz3RHDjuLKZk5rcvU6
	gPPO7WYHtwpQ+Cu0r9AXm6zjuJjzeBI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-o8p_oT1vM4e2hplDRAf6wQ-1; Wed, 21 Feb 2024 09:31:42 -0500
X-MC-Unique: o8p_oT1vM4e2hplDRAf6wQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33d4c09ec04so1650529f8f.0
        for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 06:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708525901; x=1709130701;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9inO5+Trhr7gqmLUqHbY08vfN72/KzByM6sTZmmhmQ=;
        b=GTETkgtWgtWVMoZuq5dHb9Afgw4CglBGMxUdH91TIZk0jeXKb6x4mr1Tv7RYkK/Ob4
         wlYBlGvfgtOhBVjgBc0PGEaLUtD9Ph0h9tVEqu+DqGTYE+ea3mn1mmOcNqovmvQ2DjB/
         CItC372usidJj3yZvLgOc9nfYSBEo56+3BHReeTbwqisbKChz8326g2TDhMrS9CY+RAu
         Gn+6Vt9luM2RW4Wvj7vSqB5pUf1/4Aj/dOeiW8QmJeY9rSGYK0BU5J+T4YUKjymlu5b1
         KrV67OGbu7OHjMTDGiXllsALRvPaaihKZirQ7RBUIZVckDDUrxbIlcIjPJJrhzES/IpY
         7y7w==
X-Gm-Message-State: AOJu0YwWa+YYv7wLOH+LkG8bRxciPHTf3oVloctPKS3OJE/RnG4xNiee
	btie/FTdpN+ZOZyRaq0ZEHqVWG3n0cjvzfALl/luFCjMN9JBpJkGj0UxDPzy4iEfhEZHYaZK00J
	NNBz4YmXemPEQs0YRaJ3ag215ZMlRWY2U8WayzQe+f8fysgMoyrjpCAG3S3sBWBN1oyMR2hACbO
	Y8d8QKUlWRvwXB0fu5SnsjRpMw9hsPnrCegasRuNAUw41l
X-Received: by 2002:a05:6000:d84:b0:33d:2a1e:99fb with SMTP id dv4-20020a0560000d8400b0033d2a1e99fbmr11759768wrb.57.1708525901310;
        Wed, 21 Feb 2024 06:31:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6P9WodbGTBm/O0GjR/ZQ7Qdt5j7R1SrqQIjbhPBWsMtjoU4NsUkvSDyU/gAk04uL7P2pEFw==
X-Received: by 2002:a05:6000:d84:b0:33d:2a1e:99fb with SMTP id dv4-20020a0560000d8400b0033d2a1e99fbmr11759752wrb.57.1708525900921;
        Wed, 21 Feb 2024 06:31:40 -0800 (PST)
Received: from [192.168.188.25] ([80.243.52.133])
        by smtp.gmail.com with ESMTPSA id bo29-20020a056000069d00b0033d5f5571b4sm8292709wrb.44.2024.02.21.06.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 06:31:40 -0800 (PST)
Message-ID: <652928aa-0fb8-425e-87b0-d65176dd2cfa@redhat.com>
Date: Wed, 21 Feb 2024 15:31:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.8-rc process is unable to exit and consumes a lot
 of cpu
From: Paul Holzinger <pholzing@redhat.com>
To: regressions@lists.linux.dev
Cc: Matt Heon <mheon@redhat.com>, Ed Santiago <santiago@redhat.com>
References: <6a150ddd-3267-4f89-81bd-6807700c57c1@redhat.com>
In-Reply-To: <6a150ddd-3267-4f89-81bd-6807700c57c1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 21/02/2024 15:20, Paul Holzinger wrote:
> Hi all,
>
> we are seeing problems with the 6.8-rc kernels[1] in our CI systems, 
> we see random process timeouts across our test suite. It appears that 
> sometimes a process is unable to exit, nothing happens even if we send 
> SIGKILL and instead the process consumes a lof of cpu.
>
> Reproducing the problem outside of our CI systems seem to be very 
> difficult, it took me a week until I finally reproduced the problem on 
> a system where I have ssh access. I currently reproduced it on 6.8-rc3 
> but we also confirmed that this issue still exists in rc5
> On my system the problematic pid is 661803
>
> # ps -o pid,state,pcpu,comm, -p 661803
>     PID S %CPU COMMAND
>  661803 R 98.8 sh
>
>
> I was able to read the stack once in proc:
>
> # cat /proc/661803/stack
> [<0>] shrink_dcache_parent+0x64/0x140
> [<0>] shrink_dcache_for_umount+0x3b/0x130
> [<0>] generic_shutdown_super+0x1e/0x110
> [<0>] kill_litter_super+0x27/0x50
> [<0>] deactivate_locked_super+0x30/0xb0
> [<0>] cleanup_mnt+0xba/0x150
> [<0>] task_work_run+0x5a/0x90
> [<0>] do_exit+0x35e/0xaf0
> [<0>] do_group_exit+0x31/0x80
> [<0>] __x64_sys_exit_group+0x18/0x20
> [<0>] do_syscall_64+0x86/0x170
> [<0>] entry_SYSCALL_64_after_hwframe+0x6e/0x76
>
> However if I try the same again now I do not get any output from it. 
> Also the whole /proc/$pid directory is in a weird state, it seems a 
> lot of the process resources are already cleaned up and inaccessible.
>
> Given the process consumes so much cpu I assume it runs in some 
> infinity loop inside the kernel process exit path. I also tried to 
> attach strace and gdb to the process but that just hanged and did 
> nothing.
>
> I still have the system up and running in case more data is needed 
> please let me know. Also any advice on how I could debug this further 
> would be appreciated. I can try to to compile the kernel and use git 
> bisect but given it took me a week to reproduce the first time it will 
> not yield any useful result soon.
>
>
> Note we see this in the Podman tests[1] and because Podman is a 
> container manager we make heavy use of namespaces, cgroups and seccomp 
> in case it matters.
>
> [1] https://github.com/containers/podman/issues/21504
>
> #regzbot introduced v6.7..v6.8-rc1
>
>
> Thanks
> Paul Holzinger
>
Also to add on some CI systems we see "kernel: WARNING: stack going in 
the wrong direction? at do_syscall_64+0x89/0x170" in the logs but not 
all of them. I do not have this warning on the system where I reproduced 
it. Other than this there is no kernel oops or anything like it in the logs.

