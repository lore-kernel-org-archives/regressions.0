Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94C330322
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="TAcw0yld"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-357bc05f94dso4285615ab.1
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 07:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699456497; x=1700061297; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uluPpjIeGgiIZ8x1GF72tKNny1L797NTmFEFe7K+mMc=;
        b=TAcw0yld6NePgW95HSxdVcN5nkTyAykxsX0w2okzjWn7tfTnAi9w0I4FnCtHTuePU5
         tkYZTh/9Z0x11fG06rNrOUU2EHOzVKD4NhkFFgy5FVyazWtnCQbuFsP4xvkMlVUtyhzG
         XKzgO2sYxlHv+9P+O29AoCcGmtrgrwrujY3t7Hs44EILCt836LavzWZoU4U8uF6NJIPw
         /OHWSgsNzDiMGRAXdJelv0bo7W6ivctZ0KbJqGGogDIGpy2uZqoqhPquHPGK3CvM+9aF
         19Mmv3BkKGTWPXXyqxBraPZWx3S35KTrEvPT9D02k2eH0zgf9eaAQ9OcxdUaD9xEzEqq
         CkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699456497; x=1700061297;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uluPpjIeGgiIZ8x1GF72tKNny1L797NTmFEFe7K+mMc=;
        b=qDNYBUhuaL8pHeekvtW1sZq4E75MSHDinXiyhE2BzMMbLZ6oWXC1+lP4zWj0NTao0m
         bfW3Xxg0M3q8a5Jtc11avCoLXtiDLqroxJpY7QunzmSTFHBr99wGGD4Y0F+UevdlptDy
         ZSkc5gzTSsKt8VvitDpQAmgMa46OmxzwkTTZmk+YCdFDCuvMXKVwrH4vQNquRiM484XN
         8WpCmdG72sjlOm9/mDeaJ21qAjEj5WOTZox0SW0mzvj/HzUspSMoZ5wdB+6XZPZ6r/pc
         sca9jlNSzxvYymoVQhIEhh9URqvYNeO01tDTO0dvIcs7BGjeHlIiUSJB98IbsbzCAghL
         NLeA==
X-Gm-Message-State: AOJu0Yxz24c1ID0x9w+W/traSmXCQuBcA5JT4ZDBBN3ULZmH04YaBbvj
	Yqys6dP9ewYn4I9nol0rgVPk/w==
X-Google-Smtp-Source: AGHT+IG24EIXb7Eh2qy4Z4SJVDTzpC8vfnVHiIELEGPrayMV3PV2hdnCo+oXvm9XW1UmdzPoc68q9g==
X-Received: by 2002:a5d:8ad7:0:b0:7ad:3ee0:86fc with SMTP id e23-20020a5d8ad7000000b007ad3ee086fcmr1971390iot.1.1699456496910;
        Wed, 08 Nov 2023 07:14:56 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id g38-20020a028529000000b00463facc3119sm2777587jai.137.2023.11.08.07.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 07:14:56 -0800 (PST)
Message-ID: <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk>
Date: Wed, 8 Nov 2023 08:14:55 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk>
 <505960353.45641688.1699398777243.JavaMail.zimbra@raptorengineeringinc.com>
 <7bd67c30-3b9f-4541-864a-b082917ee8b5@kernel.dk>
 <712095554.45645374.1699400040368.JavaMail.zimbra@raptorengineeringinc.com>
 <8d966878-f7fd-43c8-bd91-ac33408c9317@kernel.dk>
 <1768720690.45649923.1699401768289.JavaMail.zimbra@raptorengineeringinc.com>
 <217cea83-f527-4e86-97c2-dc9a2f8f937b@kernel.dk>
 <431496020.45688461.1699416044413.JavaMail.zimbra@raptorengineeringinc.com>
 <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk>
In-Reply-To: <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 8:10 AM, Jens Axboe wrote:
> It could also be a task that has pending IO and is doing exec() (and
> friends), this would also cancel inflight IO.

If this is the case, then you could try with this one to just disable
that and see if the corruption goes away:

diff --git a/fs/exec.c b/fs/exec.c
index 4aa19b24f281..7359a85b96ee 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1266,7 +1266,9 @@ int begin_new_exec(struct linux_binprm * bprm)
 	/*
 	 * Cancel any io_uring activity across execve
 	 */
+#if 0
 	io_uring_task_cancel();
+#endif
 
 	/* Ensure the files table is not shared. */
 	retval = unshare_files();

-- 
Jens Axboe

