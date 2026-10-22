Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677548;
	b=MleMKr+wuK69fbuptkx6NxPcAA6VLaMv6/hGQLUPIqNqu8LQef3PFoOQ/1bRo8Rx+Xyh
	 vrIPMjvgGoEk/aVl9QScpaEgc2wOKJxaYvpkT5+S//n4j9C1QgXXMd5OUH/rvAgSUOjL8
	 Rs9Oc3pHeh75ldK/RmYMFeTWO2iljdVnO4YnfgcvNn3lHyQF973Og6wQsdQ4osJX3J/H/
	 e+va3pKxppSgs6cCqW6dM12T+Ef8zqr8OVBNqAxA0eBO6K50DPmA3xR1p8KO+U2of/NbG
	 wPyVMsncMOdIg3uMwBeYy1Rslh+ROBGcQ58KDSE2K/k+zUx4/YS1OoufdgI59ZmYdPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=yapslLW8DJgafvTO1QZsoaeneeL8j2kAUWpgSuLBw/0=;
	b=091vSChbjZDH448zbeicEJXSTWCmbnAENuI4LzoBDPqlQKkNeb4+86LIryRmskDTux21
	 xJ7UvWp7Au+YBibsx2gMuDVoMKa57Hsek7QWaFnRPllhfjPrUHMkhgKK7ClhzPKhNPx6F
	 eQ84SNRxehhtPWocFyW0ufLXDuFeNbI3DnPOUhDj4zgpIS9ZUSjSbHkm5A8YhDYncdCEv
	 97O+hOqZicrPE8frCQVOaFc81Vzy2VADQWC0YDK5rZpMSQIgiATmzcQgxjCfTU+qlGbLl
	 aZXnSEt5Yc7QBRq6Ld2BFY93cDE6e44+hnt6JLwAXpKDKjun7RpJPZwB4WLWjRl9K7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Y4kbUuEa;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE8606A31B
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 13:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AE8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Y4kbUuEa
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso769660c88.0
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792677547; x=1793282347; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yapslLW8DJgafvTO1QZsoaeneeL8j2kAUWpgSuLBw/0=;
        b=Y4kbUuEa+xDixuW7i9dMzwX2UqsyHxwS6SjOVcdEqKQjXpXqp0AydHKZGj4vVu1dYs
         SEYTkCcLGdDzpb6wK7sCb9wzZdvVLVFJd/Vwt/DrqYxyQ5KZK2BVI3Ajd5xYywz/rQTg
         AzCO9AC7yi1+j2mNreBmzEJW9BK7hqCR60gIDzwP2wJhvSQYk4Ptr3iIcrPV9y08maNj
         SmRfKDNUuB2I2wdxBE0AdV6hBI3WKY96edXPI37/w1vEKYirMgEC5rtB55XxLW90u7tL
         gWfrg2wMpNWfF9OhMmzIMhc9eWTTPiuYPyN2oBAcuY+cS3ihyw6uBT96S6kD1NwsERD2
         lXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677547; x=1793282347;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yapslLW8DJgafvTO1QZsoaeneeL8j2kAUWpgSuLBw/0=;
        b=oAKjN+EPa0npSoOWim3wZ2U52F1uXu923lFDdqH5dKwHqy+rjVOVtoORPnjLER4o1N
         PuXsOCQse/EWHMwpK+ppLXM2hGJCBUB3iao5bXUPiUW80/4gKnea4qhYkoJzDLsUatPd
         m/aGrqNttXGXXu8MoMXirZttz0TNAAfSvvzPmaQFIsfSLKsmXcxn+C4/FX3slLlzeL5I
         6XDky6EZizBJ2+iNlangFwPrvkgqyKpqpDc2/NTJcLtZPSOZhL2geZnwVsoIlxb/ubf/
         kvo1vk1ojHDxG5xyxuesHx8uclAZ+WFw6IhfJHI7B/8KKuxcrFBeCcU5CpSu8ehQB4me
         0gdQ==
X-Gm-Message-State: AFq9FYJOj00IFgkb7O84IWN7S9ccngiKsRsUhEOA+WJ32+NiWSG7IASi
	baW6uDHeySpxjHSzY+5ZJ3cQMYddqhUejw3G9RetxUIjuGvJQ/GyEAn0M14F40BhJ5s=
X-Gm-Gg: AYBFou2U+fk/BrtO418nJNq1LPl+ioAWRrhVe2waSF/psBYvVDMEcs5rrqwQpMGR9Zl
	qs3RL9CXvuxDwIOaulsDQ69lAaXel7+yYZiSsd0XJ4ELEaxUOW19lL4HdNSvV4xtzKzHnPktJW4
	0MnHFUB/RZ5LMDJfEwRusUTi5Z+EXGAK+BCsBjTFxXA16O0S7lsEN0ORKQ5ZNhF3tXksU8srz0Z
	8+/gPBJNzRkKbdu7f8xBS7BRoApWYokYAuUSrSkdDQqDzyOytITA1I27HYG+GIJIWxzpa+l7Eur
	dMXehMU+TMnerNGCyglTuNAAqxTXCNk21Q6GGL7/Xg+9HXyDLN8DK6x/ytHNrRW+vaOR8TIdzdA
	12DL20j2/PuKmCUFDG0qTy6NuKASW7KZSJ6uEgZxJjPlHuKRLsL4EurZ4dEVsXOL8tZqMPWkf2v
	3c/L1dTrFsh2yNd4RhQfE0L8p2dfoeViH6jqbrSr0X3SKty+MZZ/xjpeOJ3GQQ536rIosKBv0rN
	/E7mDuOrUVtlLrfs50hd/djQixnMJG4tzSczDXDc3+FvezDtA==
X-Received: by 2002:a05:701b:2086:20b0:155:734:9cc9 with SMTP id a92af1059eb24-192f442b6d4mr3254838c88.16.1792677546254;
        Thu, 22 Oct 2026 06:59:06 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm23639534c88.12.2026.10.22.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)arch/riscv/kvm/kvm.ko: symbol
 'kvm_arch_pre_fault_allowed' undefine...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Oct 2026 13:59:05 -0000
Message-ID: <179267754360.302120.2153520610797426540@kernelci.org>

New build issue found on next/master:

---
arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
---

Log excerpt:
=====================================================
ERROR: modpost: arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined!

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179267754360.302120.2153520610797426540@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:9c12526508454935ec55c5be5b9699f5296ee63b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
- tags: next-20261022

# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ada0faa55fda507606868e9

#regzbot introduced: 9a482184d910775cf648863148944945b74e2815..bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
#regzbot link: https://d.kernelci.org/i/maestro:9c12526508454935ec55c5be5b9699f5296ee63b

#kernelci issue maestro:9c12526508454935ec55c5be5b9699f5296ee63b

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
