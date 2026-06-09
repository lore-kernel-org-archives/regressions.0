Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EA34EF07;
	Tue,  9 Jun 2026 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018097; cv=none; b=ieEhMydCOCl+Wp3iZbgOyb/kDnFnmTb8S8zvCKV9d8xpU6nETz8CnveiugmWZNNOxU9YBJsAV5s3M555YGMwGxfjX6tbSWTjOjJmycxzWciJDo1ZGLQhpPvYuuiWa/bmr1wBc8RjOxQU+wsgtvIwxRTw+5lv4QFYrXmkZRX8weg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018097; c=relaxed/simple;
	bh=JMLk+fwXWe/o2RDIb/PUQAwZ78F9pCn8cFuXtCDIuVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XoCCkQf+LUEb0ziBP3hSMqT9u+ZoQEpjxUjycLW3RPMTKAr8Xae1iZYTW+omQglTGiMxOQmDPqyw8tvDyNdrCl8aKFRqA7a4xHR5dA8b0fCR6xBoEI7Jh0nWc92MOLFvk9MA9t5TfiMtbo792MT6bhHNVYSuuhnkhLSzrpy5TyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1JRSmTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1JRSmTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4D31F00893;
	Tue,  9 Jun 2026 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781018090;
	bh=uRyFSZRVHMnouzvaAVPL92GCgMdl12W9vVxoHpFOSfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=J1JRSmTT3Pr65ktIYwSRLzrcos1tMVN/f6KWS2nDExwJLaI0lUIE0Ry1IjS1Gk5Di
	 2nikAbM29lucoVup3x3n/GGzfbCdrqm/lsqTm3JkGDInTGp71kVYZ571kZFjNBKOOQ
	 eqcg+vLzOrpGODq/ph923QybBSTcJfLLb5c1Z0ZhCCBLMIJ/9YaKj6dg663cVXstXf
	 JhZ7PpYgeu0N5sZBxJd2NrtjoTGj0LXAch1pJJA+7IU4gkpkcLVvdSJI4QPw/8fpKn
	 grkqwjy5irSN5ojI23STjIQ5F0vBvODAA95m+Ar/2am8JyECFD5YopXIha4cPL5sjG
	 O/uBgPnbWTjXg==
From: Thomas Gleixner <tglx@kernel.org>
To: Teddy Astie <teddy.astie@vates.tech>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Olivier Lambert
 <olivier.lambert@vates.tech>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests
 during PV spinlock initialization
In-Reply-To: <1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
 <87ldcp3w16.ffs@fw13>
 <1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b@vates.tech>
Date: Tue, 09 Jun 2026 17:14:45 +0200
Message-ID: <87y0gn3fve.ffs@fw13>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09 2026 at 11:27, Teddy Astie wrote:
> Le 08/06/2026 =C3=A0 17:15, Thomas Gleixner a =C3=A9crit=C2=A0:
>>   struct clocksource * __init __weak clocksource_default_clock(void)
>>   {
>> +	clocksource_register(&clocksource_jiffies);
>>   	return &clocksource_jiffies;
>>   }
>>=20=20=20
>>=20
>>=20
>
> Hmm, there's a case where clocksource_mutex gets taken twice (both in=20
> __clocksource_register_scale() (through clocksource_register()) and=20
> clocksource_done_booting()).

Bah.

> What about making clocksource_jiffies gain ->enable() to setup what ever=
=20
> needs to be (like calling __clocksource_update_freq_scale()) ?

Doesn't work either.

Updated version below. It's not pretty, but it should cure your
problem. If that's confirmed I think about a less ugly solution.

Thanks,

        tglx
---
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -60,15 +60,14 @@ EXPORT_SYMBOL(get_jiffies_64);
=20
 EXPORT_SYMBOL(jiffies);
=20
-static int __init init_jiffies_clocksource(void)
-{
-	return __clocksource_register(&clocksource_jiffies);
-}
-
-core_initcall(init_jiffies_clocksource);
+static bool cs_jiffies_registered __initdata;
=20
 struct clocksource * __init __weak clocksource_default_clock(void)
 {
+	if (!cs_jiffies_registered) {
+		__clocksource_register(&clocksource_jiffies);
+		cs_jiffies_registered =3D true;
+	}
 	return &clocksource_jiffies;
 }
=20
