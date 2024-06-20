Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D619B3E1
	for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718877929; cv=none; b=uzijererTeeUs/rjOH4ng39Q2cNxKGUTsAr3bgzOvkrogkIAAELLKTaoEqyR8PtR4rHRKaZ6pjqZv2HmN6897xb+FLPyGPSOfrKqFmmBWb0EUYB5GtXE+C8Us+U2R/EisGWAepspA++dVKyVZ1eGVntF6IZPhmiIMDEGWUsCltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718877929; c=relaxed/simple;
	bh=HDZk9HJppUsHiLTg26al0A+m7r+GdOYBJsYGlt7Qx7E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=D4uwjFKXlwkT0DzPj727AbWwtI94mNA098zW7+r23yyqcnSoS75t37Spu45LRT/RhAJ/uFbzYssPQOUmh1OydXk66KMVqNnbygzgyWVCwybmNBOJdU6zVRol4abGeXNwELqMLTPxjRbWKDJ4ITblZWxkHBnxDOGklhWzgn5af4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMlrwoO7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMlrwoO7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f480624d0fso5276705ad.1
        for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718877927; x=1719482727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HDZk9HJppUsHiLTg26al0A+m7r+GdOYBJsYGlt7Qx7E=;
        b=bMlrwoO7k/DHNuu23w/ujz13ORzFeIBR4r6XtTZGiJAmqnn36chkGkVS8w6MIifGC9
         +/3qIkD5gr8xr6F1Dh6WQA+2Q8cT3DcWvyYcMGIjnb4vjMmqwac+3B3k+FZ5EWJeksyU
         xBjLtx5UUrTkH7gHe+c+m5jg8G0hUF53LsR7FkJrMt96Z3jlbIqgNgCCSkdg3gopD7KF
         uOrbh6uAX996/LRoCtEdJqPIDqPakVlMoe8Y4x/ZxRDeKP8KI8uBONtVFeRSK8chz3mI
         hbWD/p6FmerNOADUXUV5Bn0eROZb5iHjrm+e5ClIk7nlQtKH6IyPVCoEFSkZwBpQQSA8
         rlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718877927; x=1719482727;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDZk9HJppUsHiLTg26al0A+m7r+GdOYBJsYGlt7Qx7E=;
        b=rJmSKj2nDRftkRrIOnyAFpfC4udKHmlM1xkYLqKm3Z1ZiBlDAtvA6nP8Yol+3QJJkn
         wdh9JZEyVp5WmAs/ceodLgcx5QmLsxmANXn9ipoMhcti+BqJYiEatLPM7YvfB2Z8Go0Z
         4ZXCSSa84h5O97jWEEtzQdQ24lQ/S8BjN4HRZweTt0Pj/HghAV/6XUBh9awq638SxKsr
         KXv9P3Vl5lTZrnHeGosQcEygb/AdT2TRhrWkpPZH4rndAFywxXhQfvLq3dQc9hlQTlVI
         v5kQrZvETU3nOgTWjvVqhUV3gJpNRvgsp0A1mnw0Ji6Futfp7XPtResGUZwMzuiXSvsb
         3wqg==
X-Forwarded-Encrypted: i=1; AJvYcCVtg89147B4bb9b5QcgyA8nBxem2aqpwpsqNielNHfhrlCe/VifvCgU6LPbujTDSO97jL0MsdgApxSKWwGi6cW3t6+bcp0/ai9XBA8=
X-Gm-Message-State: AOJu0YzQh9jfDGcC2dNjUsWmT7EEGhg1yFCerf2zcCfkvrJkRr9QF+Qz
	EawHhsteN4Ob3FnlUJFENHFdQwRAHLeVXwewrCc+JY/gk7Q0LdiG
X-Google-Smtp-Source: AGHT+IHKP0cjFNlKm9wf9h08SQSeHk8JMac7e/kdLm1Cay1idYN22fHCErHQ1so6NkdBrqsZNuoh7g==
X-Received: by 2002:a17:903:230a:b0:1f9:ddb9:3ee5 with SMTP id d9443c01a7336-1f9ddb94098mr411145ad.26.1718877927301;
        Thu, 20 Jun 2024 03:05:27 -0700 (PDT)
Received: from [127.0.0.1] ([49.205.38.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9b17f9bcasm30533305ad.161.2024.06.20.03.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 03:05:26 -0700 (PDT)
Date: Thu, 20 Jun 2024 15:35:23 +0530
From: Mathew George <mathewegeorge@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Bernie Huang <phhuang@realtek.com>, "kvalo@kernel.org" <kvalo@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: [REGRESSION] Freeze on resume from S3 (bisected)
User-Agent: K-9 Mail for Android
In-Reply-To: <342b6b95d97a4bf09afee15c09481efc@realtek.com>
References: <87tthpwkqf.fsf@gmail.com> <2ce41d4129234ba9a91d5b4dcd8a40ee@realtek.com> <87sex93s63.fsf@gmail.com> <6970398610c546b1b62e599902c67572@realtek.com> <E3FF7BC1-725B-40E2-AAF0-CA41A44B9DF9@gmail.com> <342b6b95d97a4bf09afee15c09481efc@realtek.com>
Message-ID: <CFB0314C-AE45-4563-BF41-F5D635BFCF86@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

> I have seen that, but no clear idea for now, so I will install Arch Linux=
 as yours
> in my side=2E=20

I really appreciate your dedication here, but I'm not sure that this is re=
lated to my OS=2E I
feel it might be a corner case that manifests only on certain hardware con=
figurations,
otherwise it would probably have been encountered by other people by now=
=2E
I can't say this with any confidence, since this is my first kernel bug, a=
nd I don't have
any factual basis for this feeling; I just don't want you to burn yourself=
 out with the Arch
installation process when it might not help in diagnosing the issue=2E
Ultimately we'll go by whatever you think is best, though; you're the expe=
rt here, not me=2E

> I feel this problem may be easier to reproduce on Arch Linux, so I would=
 like
> to know Arch Linux iso file you installed=2E

I don't remember the iso version that I used (it was years ago), and I don=
't know of any
way to check, but it shouldn't matter=2E AFAIK the Arch iso is only used t=
o bootstrap the
system, so its version should not be of any consequence to my current conf=
iguration=2E
You might want to look at https://wiki=2Earchlinux=2Eorg/title/Installatio=
n_guide
to get an idea of what the process is like; as you'll see it's very manual=
 and takes a fair bit
of effort=2E
