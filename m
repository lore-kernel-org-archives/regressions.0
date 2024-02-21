Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F547D417
	for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708525262; cv=none; b=Y/i6af7lCquz2BVjQgMaTDa3nMQmmYNooS4QxsBimvmXJN31562RYwb1pSQ/uFBSMszLva5rVEq7ZSh0OEmyQM3AMIX5x0z2hrLAoTUeTISiURMBqSYwAsp1e15N3hNO4IV7qOid986FjsshiDAeUD9g96xCVFVRGJlSOiaCPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708525262; c=relaxed/simple;
	bh=XBgm3NMRlx7nnVsLuBuTWtxjiqyXmulzyqeZaOEq+RM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=eDcaKGajJJVqSoHvFtiHRgh1FMTSmQTe7Ix4nIA0j1NJnwFpF+JzRsPEv57+rdh6qfRLwvhUg8ZVjY2jPWQGcaks9Vo972rkeZmoYa2p4hIgK6+D8KQyeGjjxaZ8FU6wuhyXpQmPfwwjFgAgF5b+4nngOnFiMDP6gG30CLEBb9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O2JgVq9b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O2JgVq9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708525248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pKiRH/FNVmfn6kjU6vVbtt1MccXnRpiLUIQ6h3WEyio=;
	b=O2JgVq9bNou85/sYe9KnTKrZjxYEeSqRYAycg2OFF4QopxdaCU4PaUZ5VVdsuGVHuS167N
	mtS48Us3tDSwJKifG56hQHWSUNqLxVZS3AAvZj6e2/xRHV7Hf9FtxS404ZDaicK3fQuYkh
	OfRsrSaI2Xc39kn8LZqLlhc/pbcT1Ko=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-7uf0tHK7PXuXs5q2GYDMXA-1; Wed, 21 Feb 2024 09:20:45 -0500
X-MC-Unique: 7uf0tHK7PXuXs5q2GYDMXA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4126d660f01so10561435e9.3
        for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 06:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708525243; x=1709130043;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKiRH/FNVmfn6kjU6vVbtt1MccXnRpiLUIQ6h3WEyio=;
        b=c93W+/ZIgle2maotH0L5CwcHIv+iCANtUJHsXs7xwrA79Ujbr6gDLHa7oDSfQc/g8v
         zH3q8IdOuj4BY1mCQ+m1LE6f5Db5FC09R0FItpoDc+0+4rQDkCdZHFarITctaBjTTiP+
         YGV0WsQRPQIXnrULCNlMgUZTA5xfO8HyBPscE/hNEZ4+WN1HP53IHh4Xh/HLEpu/S3+L
         +SP3IuisIOOvo/nd26nqZ8DlkXdW/XJkRyoIqWGI96/06bqAxLuVx1au7xXIxIBB6yhh
         CuFzW3wh3UIkvS9cynUb3+sRvIlIi+6/l55mlYKR3rGcCAc+1Fy1Gt6RWoLAjiZ0TdvL
         ImWA==
X-Gm-Message-State: AOJu0Yx76x79aABUBVD16jWl3S5EHzm2Mt3eHdXvGKjAdqgM48gjVh4b
	KM3lvc2qh9CS6LWreI0VoFfPKB0/I0Fy2xLLkwvmWccYaZfoeg6OmzgAerXMSEqki3IaJCKP3I+
	exyqKiWYHqV4WxrAB/hHvMzAQ9oe4doVRZBJ9sIX6z/OQH2Gr+aGa8NadqoMIIFOheaS/Xm3SQv
	pSIAE24/lhEahpvMo8rJOev8fFMuCWufWCdtVxpY4zGafo
X-Received: by 2002:a05:600c:4f14:b0:411:eb4f:7fb6 with SMTP id l20-20020a05600c4f1400b00411eb4f7fb6mr15414272wmq.8.1708525243416;
        Wed, 21 Feb 2024 06:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3dmM274cQ5oDdqAZouEeA82Rqv2m2B9cVPJa4iHpjo5RNtgQeO5hn3xwfURxruB9sUv7vUg==
X-Received: by 2002:a05:600c:4f14:b0:411:eb4f:7fb6 with SMTP id l20-20020a05600c4f1400b00411eb4f7fb6mr15414214wmq.8.1708525241827;
        Wed, 21 Feb 2024 06:20:41 -0800 (PST)
Received: from [192.168.188.25] ([80.243.52.136])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c230d00b00411d640085csm18047941wmo.43.2024.02.21.06.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 06:20:41 -0800 (PST)
Message-ID: <6a150ddd-3267-4f89-81bd-6807700c57c1@redhat.com>
Date: Wed, 21 Feb 2024 15:20:40 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Holzinger <pholzing@redhat.com>
Subject: [REGRESSION] 6.8-rc process is unable to exit and consumes a lot of
 cpu
To: regressions@lists.linux.dev
Cc: Matt Heon <mheon@redhat.com>, Ed Santiago <santiago@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

we are seeing problems with the 6.8-rc kernels[1] in our CI systems, we 
see random process timeouts across our test suite. It appears that 
sometimes a process is unable to exit, nothing happens even if we send 
SIGKILL and instead the process consumes a lof of cpu.

Reproducing the problem outside of our CI systems seem to be very 
difficult, it took me a week until I finally reproduced the problem on a 
system where I have ssh access. I currently reproduced it on 6.8-rc3 but 
we also confirmed that this issue still exists in rc5
On my system the problematic pid is 661803

# ps -o pid,state,pcpu,comm, -p 661803
     PID S %CPU COMMAND
  661803 R 98.8 sh


I was able to read the stack once in proc:

# cat /proc/661803/stack
[<0>] shrink_dcache_parent+0x64/0x140
[<0>] shrink_dcache_for_umount+0x3b/0x130
[<0>] generic_shutdown_super+0x1e/0x110
[<0>] kill_litter_super+0x27/0x50
[<0>] deactivate_locked_super+0x30/0xb0
[<0>] cleanup_mnt+0xba/0x150
[<0>] task_work_run+0x5a/0x90
[<0>] do_exit+0x35e/0xaf0
[<0>] do_group_exit+0x31/0x80
[<0>] __x64_sys_exit_group+0x18/0x20
[<0>] do_syscall_64+0x86/0x170
[<0>] entry_SYSCALL_64_after_hwframe+0x6e/0x76

However if I try the same again now I do not get any output from it. 
Also the whole /proc/$pid directory is in a weird state, it seems a lot 
of the process resources are already cleaned up and inaccessible.

Given the process consumes so much cpu I assume it runs in some infinity 
loop inside the kernel process exit path. I also tried to attach strace 
and gdb to the process but that just hanged and did nothing.

I still have the system up and running in case more data is needed 
please let me know. Also any advice on how I could debug this further 
would be appreciated. I can try to to compile the kernel and use git 
bisect but given it took me a week to reproduce the first time it will 
not yield any useful result soon.


Note we see this in the Podman tests[1] and because Podman is a 
container manager we make heavy use of namespaces, cgroups and seccomp 
in case it matters.

[1] https://github.com/containers/podman/issues/21504

#regzbot introduced v6.7..v6.8-rc1


Thanks
Paul Holzinger

