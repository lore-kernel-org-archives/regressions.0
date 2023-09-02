Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D8C7F
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 00:21:04 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1ccb58b0099so1639313fac.0
        for <regressions@lists.linux.dev>; Fri, 01 Sep 2023 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693614064; x=1694218864; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Psrz6OLugnAHI8N/ongnXW3Llo2Oy5igQZp0EV1W0To=;
        b=fhHqVoAfPb++2R46GcpiCkQ4n0r2T90igoK2UCqzqHRV0KNjg2kY1EzfSLJWkdaulG
         f/mpwzqIW1+L9dbGTSbs6k/BNwqZCj2VIYK+1fIDooKTpjxJhpOgMRpFbGipsacoYIy8
         l1XvK3GSE4a9gr5rkHGaFWFvXlnjAsuecZBQTi1Jy51hHNpfWWbQgCpctv8OiON6c1hh
         iZT7Q37ypWU/iTpTckUX+VLKzKFyymGRhdSHfnGR+LaxK9MqL2kzLBX4LIkEo9kF+Vj6
         3DvuP0tVnRWLJtjVOfetepUt2kDrbxBF6uM/d4uvd31hG8/FJ81AbSsGbrPUKH5kdfAa
         hCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693614064; x=1694218864;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Psrz6OLugnAHI8N/ongnXW3Llo2Oy5igQZp0EV1W0To=;
        b=QEl4Xk3ohnJMiyijightmJChqhkm+2aXfzQKR3sUGec+GbK2OCOSuTa4GS4zQYO3/h
         zH8O+97jwli29X08Q/kTwZf+Yt6j33bwlqHAvo1akidze/LG4kdFI7WZNOalZvHyJxR/
         jDbOF1M5522LR9ZaOJ4ZUyvbNjB1C5HtUT+l459R7CBCQHvg6fkLURayx5106qs7Z0Bg
         QVw0B4b4jxaZ8lFY1oTYnF28TGoJ6Lc+r3F9V4CPaF4jgLMXN9d2Po3zeJ3LWEBQRxqD
         CwJ/iPExZTOQ6dz9s04FWplbZwC0hOpKFsKwOVvv9ZMt+letMJIDXiHiLIjNNN5hL8HO
         ldZA==
X-Gm-Message-State: AOJu0Ywj0JYXKyxOeAQ5uUJdY4qXJf5mynNCTtXOsHVnoojqugbgR0tS
	XZ/rm7kap3as/U3qjnWp6+A=
X-Google-Smtp-Source: AGHT+IFW9L2FLM8HcMkKhApzzFEzKsT9XZi/6S0+2uIs6H5Z0No5EZjuDhBc7GDMPQLEFnuqZxe4CA==
X-Received: by 2002:a05:6870:561f:b0:1bf:2ad9:8dae with SMTP id m31-20020a056870561f00b001bf2ad98daemr4717892oao.45.1693614063761;
        Fri, 01 Sep 2023 17:21:03 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090a5d0700b0026b12768e46sm3488542pji.42.2023.09.01.17.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 17:21:03 -0700 (PDT)
Message-ID: <0e6de51b-da1d-43f0-ffae-fb521febbe07@gmail.com>
Date: Sat, 2 Sep 2023 07:20:55 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Sean Christopherson
 <seanjc@google.com>, Janpieter Sollie <janpieter.sollie@edpnet.be>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Uhhuh. NMI received for unknown reason 3d/2d/ on CPU xx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> seems to be a regression since 6.5 release:
> the infamous error message from the kernel on this 32c/64t threadripper:
>> [ 2046.269103] perf: interrupt took too long (3141 > 3138), lowering
>> kernel.perf_event_max_sample_rate to 63600
>> [ 2405.049567] Uhhuh. NMI received for unknown reason 2d on CPU 48.
>> [ 2405.049571] Dazed and confused, but trying to continue
>> [ 2406.902609] Uhhuh. NMI received for unknown reason 2d on CPU 33.
>> [ 2406.902612] Dazed and confused, but trying to continue
>> [ 2423.978918] Uhhuh. NMI received for unknown reason 2d on CPU 33.
>> [ 2423.978921] Dazed and confused, but trying to continue
>> [ 2429.995160] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2429.995163] Dazed and confused, but trying to continue
>> [ 2431.233575] Uhhuh. NMI received for unknown reason 3d on CPU 36.
>> [ 2431.233578] Dazed and confused, but trying to continue
>> [ 2442.382252] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2442.382255] Dazed and confused, but trying to continue
>> [ 2442.725076] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2442.725078] Dazed and confused, but trying to continue
>> [ 2442.732025] Uhhuh. NMI received for unknown reason 2d on CPU 48.
>> [ 2442.732027] Dazed and confused, but trying to continue
>> [ 2443.666671] Uhhuh. NMI received for unknown reason 2d on CPU 48.
>> [ 2443.666673] Dazed and confused, but trying to continue
>> [ 2443.756776] Uhhuh. NMI received for unknown reason 3d on CPU 39.
>> [ 2443.756779] Dazed and confused, but trying to continue
>> [ 2443.907309] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2443.907311] Dazed and confused, but trying to continue
>> [ 2444.004281] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2444.004283] Dazed and confused, but trying to continue
>> [ 2444.207944] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2444.207945] Dazed and confused, but trying to continue
>> [ 2444.517408] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2444.517410] Dazed and confused, but trying to continue
>> [ 2444.946941] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2444.946943] Dazed and confused, but trying to continue
>> [ 2445.573807] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2445.573809] Dazed and confused, but trying to continue
>> [ 2445.776108] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2445.776110] Dazed and confused, but trying to continue
>> [ 2445.969029] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2445.969031] Dazed and confused, but trying to continue
>> [ 2446.977458] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2446.977460] Dazed and confused, but trying to continue
>> [ 2447.044329] Uhhuh. NMI received for unknown reason 2d on CPU 46.
>> [ 2447.044331] Dazed and confused, but trying to continue
>> [ 2447.469269] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2447.469271] Dazed and confused, but trying to continue
>> [ 2447.866530] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2447.866531] Dazed and confused, but trying to continue
>> [ 2448.456615] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2448.456617] Dazed and confused, but trying to continue
>> [ 2448.509614] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2448.509616] Dazed and confused, but trying to continue
>> [ 2448.758005] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2448.758007] Dazed and confused, but trying to continue
>> [ 2449.093565] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2449.093567] Dazed and confused, but trying to continue
>> [ 2449.227344] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2449.227346] Dazed and confused, but trying to continue
>> [ 2449.770534] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2449.770535] Dazed and confused, but trying to continue
>> [ 2449.955594] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2449.955596] Dazed and confused, but trying to continue
>> [ 2450.077872] Uhhuh. NMI received for unknown reason 2d on CPU 48.
>> [ 2450.077874] Dazed and confused, but trying to continue
>> [ 2450.190844] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2450.190846] Dazed and confused, but trying to continue
>> [ 2450.561450] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2450.561452] Dazed and confused, but trying to continue
>> [ 2450.604498] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2450.604500] Dazed and confused, but trying to continue
>> [ 2450.814451] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2450.814453] Dazed and confused, but trying to continue
>> [ 2450.923171] Uhhuh. NMI received for unknown reason 2d on CPU 49.
>> [ 2450.923173] Dazed and confused, but trying to continue
>> [ 2451.084612] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2451.084614] Dazed and confused, but trying to continue
>> [ 2451.793342] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2451.793343] Dazed and confused, but trying to continue
>> [ 2451.793662] Uhhuh. NMI received for unknown reason 2d on CPU 48.
>> [ 2451.793664] Dazed and confused, but trying to continue
>> [ 2451.926819] Uhhuh. NMI received for unknown reason 3d on CPU 48.
>> [ 2451.926821] Dazed and confused, but trying to continue
>> [ 2452.502583] Uhhuh. NMI received for unknown reason 3d on CPU 49.
>> [ 2452.502585] Dazed and confused, but trying to continue
>> [ 2452.675633] Uhhuh. NMI received for unknown reason 2d on CPU 61.
>> [ 2452.675636] Dazed and confused, but trying to continue
>> [ 2452.974655] Uhhuh. NMI received for unknown reason 2d on CPU 48.
>> [ 2452.974657] Dazed and confused, but trying to continue
>> [ 7065.904855] elogind-daemon[2461]: New session c2 of user janpieter.
> 
> according to dmesg, this happens without any special reason (I didn't even notice)
> some googling points at a ACPI C state problem on AMD CPUs a few years ago
> in 5.14 kernels, I didn't see it.

See Bugzilla for the full thread.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217857

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217857

-- 
An old man doll... just what I always wanted! - Clara
