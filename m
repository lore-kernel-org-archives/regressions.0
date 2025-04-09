Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0651D54E9
	for <regressions@lists.linux.dev>; Wed,  9 Apr 2025 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744199299; cv=none; b=Nm7ZQgfO8p7hFneuHT8YMJq7PdHK+xX57C1GvZ+lBIM2cTzGasiTQlRtHSAYfM0hoEPxHsoC/g/wogSU8hU3kF2g0vMixdFDk1z0h1JpHYNELDnJCviVhBnY9KSXuKTsy6+4JjjB8zb3vMN9WxbC7LOQ4T9FaNlxPUn7m2egamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744199299; c=relaxed/simple;
	bh=+oMoXLBfa87YPe/UNOg7aaY6mbyRAPo+nUe66s5gpds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nf6vlSE2pxtDYfLO+js9fFR7TigATtS/iGHTs9yKHw2XPW8DaYWO2Cv6lo2Gz8Z7Uq5zvo1sfIlr4SVXKFi8pfM33+Q/jxMt1t4Jsrez7Flb7PT6SLbnR9k2/6YhWTe5vQrnMtWz4ICxLLC+rjqmq1Pnn1ZAS6f1sDUtnAwIBHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfuBii79; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfuBii79"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4772f48f516so6179061cf.1
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744199297; x=1744804097; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tHSDlEdPwKlUtCjkffb48g0X0GykFB7y5RiiSKGZcyQ=;
        b=IfuBii799gXr5S89Ie+2//K0qwfuulT4m0oq4KxekhBTZHU8dQEmlOw92AgGewDp/e
         71frP7/RaDkiehTxwMGn85Qj3XbbKCAcIbmlfUGZnDpPVrC8UILV6L3zAek+zRpqUJ/H
         j7nH2IOgo4HNG6OryQRRA4qr6M/0YstgUk3quvATJMVnmkGlgfvAya8Plxu1FH48ZMPc
         ao1RrN8KMN4QBg1dkJCEa9343dBBaPKEF70tFbrY0TThSMqtewWuqHlIJSRbs17E0BT2
         NVjjWqdS4DYsRG1qFsKel+PfRzX5uT+8R8XnCTCfQRNCoBxgMz4oSFuKOaMkL9QUYrWm
         FVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744199297; x=1744804097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHSDlEdPwKlUtCjkffb48g0X0GykFB7y5RiiSKGZcyQ=;
        b=UowDhRvFD8E3xWQtOnp25Nrb9YiiMxndFGnIrdH+NbuiLyBh+dDCUGY/T18zdtOUgZ
         puKrKYkM+2i+ngJLUXyRN0DpSibmTh/hPxszoAv3hEhFpLV8rm/JZ2Y3xP0cTen/i/AI
         cHkP+zzgME28gQJtjKZJwv8YRnTImhwGs4XTcnzE0B/ttd8TCn0Z6jeVPK5zVGC4WvCP
         IDm/1FVBrotXLK+hSKrbez+mTzDuGNoGPstVxZpSxtghxLaiQYU/uN/j/+EM0Sfsx4lk
         I3mlGHWGz18LRSIGt4xKBN3scFkegzaKSHV8r+AJSlWJWhcP0psvbTcwL7CjIf+ArM5g
         ZcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXub2HPDyG1gDj/0Qx2LaxB0g5W0CdBoniYYRxbAR/Bg+qo6ye7XQigII5mMKh5nGXERsr2X1I2f7coJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWvVhcIWDhcSgiFb0OkamVb00DmngNcMr/CJujNUEnukcRmSfp
	zTTYlYA14J2206HDj5yyfYKBA9b3M5WiPGante5q1DgqMYHHhTaDZZQ9yXgsNyWq8/kG8Cwqp/4
	H1t7xqs7T6b2Wxa1YmAv5Tjt6qt0=
X-Gm-Gg: ASbGncuKU2PI/zHF/4RtX+nJPCRPBBJtyKk11qJn9nUvvDtWRExQ27Hrc6uFKQS4UwQ
	+tfT+MLfVGwgKaDc90n3WcT6kVb5NS66A/Su6sH+N8I4A+ja41xdB/B2+n0/nbIPEryUUbrU/H1
	SvTYbWgRi8CGt8n9CIE1b803TXYpS6W5G2lQ==
X-Google-Smtp-Source: AGHT+IH6eUbNeyGRk027zF9EhS6NwfHmHuH42uSvLp7fAFVN+UVc1L1H7PMlVrQr24+zxeRAG2OjCnP3jVGMNN/aNmY=
X-Received: by 2002:a05:622a:114:b0:478:f69b:ac9 with SMTP id
 d75a77b69052e-4795f0b83fbmr38688751cf.11.1744199297071; Wed, 09 Apr 2025
 04:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com> <Z_Tlc6Qs-tYpxWYb@linaro.org>
 <Z_U_LN0AtH_n4YtE@sultan-box.localdomain> <Z_VTRspvmOUfrawh@linaro.org> <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
In-Reply-To: <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Wed, 9 Apr 2025 19:48:05 +0800
X-Gm-Features: ATxdqUG5KB4LocopZgCp1oV_viz4WDlRXxnLxwjzi5vXxKdUwROIw059B5MhYhQ
Message-ID: <CAB8ipk_Ayqmh=Ch2aH2c+i-q+qdiQ317VBH1kOHYN=R9dt6LOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Or can we modify it as follows?

-->8--

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 1a19d69b91ed..0e8d3b92ffe7 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct
sugov_policy *sg_policy, u64 time)

        if (unlikely(sg_policy->limits_changed)) {
                sg_policy->limits_changed = false;
-               sg_policy->need_freq_update =
cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
+               sg_policy->need_freq_update = true;
                return true;
        }

@@ -95,11 +95,15 @@ static bool sugov_should_update_freq(struct
sugov_policy *sg_policy, u64 time)
 static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 time,
                                   unsigned int next_freq)
 {
-       if (sg_policy->need_freq_update)
+       if (sg_policy->need_freq_update) {
                sg_policy->need_freq_update = false;
-       else if (sg_policy->next_freq == next_freq)
-               return false;
+               if (cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS))
+                       goto change;
+       }

+       if (sg_policy->next_freq == next_freq)
+               return false;
+change:
        sg_policy->next_freq = next_freq;
        sg_policy->last_freq_update_time = time;
