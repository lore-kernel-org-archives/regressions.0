Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E0DDBA
	for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 09:29:37 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-688769faa09so840920b3a.2
        for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692178177; x=1692782977;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f5BYvEce/F1cmXY7W4zhFqxHtG2dJLGLUEOjfJLzZY=;
        b=HF+IrMNDNVSOh5iej+S5xx12/PM9187CQXWG3aXHq61M+u6l5dWj7qaz4m8PgXBKD9
         PyVpw+V/ym9/fL+xuXzHTY8I7JAHFqRIdyCCL5DutWRpnCk9444bsM5mBcGBnQsGfRCe
         Lt90MjcMrNTkeQkZdk5WuAmRUOPIvZSdGXrfQfkgeuWjduIBnNqK3D1Um+kexN/dHTgW
         WSgy8AXOQ+kxQ6xg+x9Cr0zZ4xXQgEO2lGt1KZhpM6nu8aEpeA9opyCDjPyk5FsCAsvE
         4r86oCjTK5MQfd7YT/3MAFORY7vXEaM3rBhLpx7WADykuST2ZO/gI0nnM8vKd5Tw1FYw
         iUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692178177; x=1692782977;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6f5BYvEce/F1cmXY7W4zhFqxHtG2dJLGLUEOjfJLzZY=;
        b=goKFKKoVEuo2hN6a1E4MMONHUM7Sla2MQteUvPN7B0W7W6Aen5XBMnEDiBpBWrMd91
         Og8zbEyPVMY0itYjsYT41dsovuGZ5IlkSFHtzbve1AvYSfxGKc+VKTq2lAKILyH3C3Mf
         ujYCQ+sUwSw1VLMUfee+0YpUXDkV8eCyFgMSTYuw8l78IIWdZUW1JGpMcoZj9SspYpH7
         ccxIAE6Yrw7I/0oU7e48w0AorHZ3NBLbCAqGNO2t4tAUo4zF1c5Zh8QqVMnf/k5rOD2o
         KdwYfw5EhoNKeFaCZDQu6GXYDPb996dAykH9CBoWLslPkSv1dPQZlH6zFD2HxA5CNknk
         6oag==
X-Gm-Message-State: AOJu0YyDPcIyNnZZdalTCpZXgPgIkt9nCqGmFwY84OX7VVtTsg54KoFR
	FPjMb0S5308WLTlxpfem5qY=
X-Google-Smtp-Source: AGHT+IFBmK5dDRcDncGF7Hzo04/buq2t1ZRCk5LF+i4ASyWRT3YWs/uPIkm+FwAGNUPD3KVU5HYWWw==
X-Received: by 2002:a05:6a21:4985:b0:13b:79dc:4538 with SMTP id ax5-20020a056a21498500b0013b79dc4538mr1428744pzc.62.1692178177115;
        Wed, 16 Aug 2023 02:29:37 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902988400b001ae0152d280sm12507835plp.193.2023.08.16.02.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 02:29:36 -0700 (PDT)
Message-ID: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>
Date: Wed, 16 Aug 2023 16:29:32 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Roman Mamedov <rm+bko@romanrm.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux KVM <kvm@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: kvm: Windows Server 2003 VM fails to work on 6.1.44 (works fine
 on 6.1.43)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hello,
> 
> I have a virtual machine running the old Windows Server 2003. On kernels 6.1.44 and 6.1.45, the QEMU VNC window stays dark, not switching to any of the guest's video modes and the VM process uses only ~64 MB of RAM of the assigned 2 GB, indefinitely. It's like the VM is paused/halted/stuck before even starting. The process can be killed successfully and then restarted again (with the same result), so it is not deadlocked in kernel or the like.
> 
> Kernel 6.1.43 works fine.
> 
> I have also tried downgrading CPU microcode from 20230808 to 20230719, but that did not help.
> 
> The CPU is AMD Ryzen 5900. I suspect some of the newly added mitigations may be the culprit?

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot as stable-specific regression:

#regzbot introduced: v6.1.43..v6.1.44 https://bugzilla.kernel.org/show_bug.cgi?id=217799
#regzbot title: Windows Server 2003 VM boot hang (only 64MB RAM allocated)

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217799
-- 
An old man doll... just what I always wanted! - Clara
