Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D8280CE0
	for <regressions@lists.linux.dev>; Sun,  7 Dec 2025 04:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765080346; cv=none; b=mYaFOtmw15K2K3/qRnm3YJlscL15Fp+xNgJCK82I2SD9FTHGwqVYnfJV3uP5N/DLk5xu1QqTSZCfb6mNpqJpNW6x2kFdEU/6Epi+KMHZDRD9TW1qeurFUJrYey3ahwW45KV9o1sR53+KjhJrM1MdwzwrHHZGYnhUJ/q/vGY4oYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765080346; c=relaxed/simple;
	bh=PWZ147u1Ppf7yNYMcL7wpdf1sLLMlRa3CTb2HAu1DTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEpzNEIxIMZb95p9vRd/7+nmmqeZKVxNkjY+pc1AglE5ClS4uTMjmXtvTXeVuBU8PjrEDHw0Li7Cq4sMxCkkpIe82SUYZc3pYsgwyBFcMqO5dG/FuV+ULlh/PjbWYOZqXETdz+lc7JPlckkx1Vp50rA306XHCAif3PGotXLoj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOfKCWoG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOfKCWoG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5957e017378so4428560e87.3
        for <regressions@lists.linux.dev>; Sat, 06 Dec 2025 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765080343; x=1765685143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex2lzVAczuwvkjLV+fgi87Xz5EH5RAk0RHJHjHXLtww=;
        b=WOfKCWoGpNcBqKeDO5ZMN7wZJnIMXInfCnr8tP9bD8VwaNmT4YAqk1uGQUfISiqo8E
         +XXoemthNIyfJbvkc7jXY2fPU0x+RxDhx+VV0acNcD+sePSaqUmsyCNGrxeBMBw/014G
         /srB2qRWFSrD2ZGkjI1dEeijyzVzp7md7DWTNgKBHmO5MwpviIf+CBbxkWkzSSy6HEyr
         MUsaFSLhgd7iRw7/fYXBhnpHx1meUnhtEM62WP72QIV8ssLizoYiR6r7CJpmkYsleb3Q
         NgzvConGoDWM7ldSDBWmt4ZUjkcH+UHM0FlP3n5bYBrasjdKDuoSsn53tEZMjz5rh3B+
         lETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765080343; x=1765685143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ex2lzVAczuwvkjLV+fgi87Xz5EH5RAk0RHJHjHXLtww=;
        b=PiINHIOu+AIr97AxAVO9ycmF2Q4bp1sBURVCZbJT7IxJJbVH5F/Sk1ew3vbC3ORas1
         z5617x8j1pM5r3x+0pQGRCFXoVP2DsTZtCRuQocCwHHzBX+5q94ZhncfIspoTUbxuuVe
         K3x9lEz3UG0/Qv237dLKFZqHQ6F04LitTK6Iylxw6ReRuMZhrfNDqhcURzlNcGxxChxm
         MWxD9giVaIXFYnzepMp9qWMdnv+0Ep+NM4OzE50BILonEaowT2bxDsUDhfJYXSLGbIRK
         E2ohZntwaQhdkQIWmLo96dq8JispSN1jnAT5ld70yKinGy1OWW68gBhq99lhTV7PLoqh
         KGpA==
X-Forwarded-Encrypted: i=1; AJvYcCVLi3Qy5coGrwjGS+p2LlNn6DSQf+NBNJ+LmvMiIzO/pxsHcbTypLrO9K3/IZevNekiROhaCXXBpQTUiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxVgxnKFeODMd8H4ibAlbhX0cigBvycFdKJeSFFva5BsMbXuc0
	D1nHhdWycaYG8jdK59VoQihTP2nyxnMAO4XfxDbxc6CTgn1FY7MXmVbA
X-Gm-Gg: ASbGnct5S+VM8pmXCzQQtEppzt09qibC6oQYkyNnE/SS55rZvgtQer7iex13ck9b5EC
	ijCDf+v6TnNPZqgt+dwpK9cZSWEcepHCOTpOY9QgEep7o1SLIJTsQwHFpa33U2DDvb8juJzoxZ3
	hJgwOLlcGVJHK+yrgvvI3Pd766mxN4tPyVFwHc4YW8YOxTLMEcKhwti9KX3eJ9dJJ+CsblXMZk7
	tIjfeKL2X8LqsIswQTMTc+plRP42F+TikWhBqOAzcTWcRymfimn8lfT2jWdg5D8KbL2kNMrr4NI
	LFzWP9LzIl7aAngfrKfinqP8mLQehktVG9424MMMaXNH5sl9SB60cI0LTH8N97WS12i1NWD5DBE
	nUi/nos3PfxyFHk5xSRxhJUrBfFQsRKUBByZl2ZLZS4JKJ5ki2BCBpXfEj6+nXMMxULtG1zl3cq
	69tYx8SFb/
X-Google-Smtp-Source: AGHT+IH8mx3P/9V/pAGu8lz10DNuwJ7kxmYDCtybY5oUGluuyAcyWcsd4RN6gkh3q7lmDuDfA7g2qg==
X-Received: by 2002:a05:6512:31c6:b0:595:80d0:b68c with SMTP id 2adb3069b0e04-5987e8bf711mr934848e87.25.1765080342615;
        Sat, 06 Dec 2025 20:05:42 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7c270f1sm2912765e87.72.2025.12.06.20.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 20:05:42 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	safinaskar@gmail.com,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Sun,  7 Dec 2025 07:04:59 +0300
Message-ID: <20251207040459.3581966-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy, Mario and others.

During these months I found zillions of suspend and hibernation related bugs.

It seems hibernation is not well supported.

For example, it seems hibernation is not supported on Chromebooks [1].

And Fedora intentionally disables it by default. [2]

Other operating systems do similar thing. Hibernation is hard-to-enable
in Windows [3]. macOS on Apple Silicon hibernate in very limited scenarios [4].

But I still use hibernation.

So, I have an idea. Maybe we should remove as many as possible hibernation-related
code from kernel to make sure that remaining code is easy to support? I. e.
maybe we should remove some even-more-obscure-than-hibernation features,
such as hybrid sleep mode, to make normal hibernation easier to maintain?

If you like this idea, then I will happily write patches for removing
some hibernation-related features, such as hybrid sleep mode.

Other ideas:
- Remove uswsusp (i. e. kernel/power/user.c ) in favor of normal hibernation
(or vice versa, i. e. remove normal hibernation and keep uswsusp only)
- Remove hibernation to swap partition and keep hibernation to swapfile only
(or vice versa)
- Decouple hibernation from swap completely (i. e. hibernate not to swap
partition, but to special designated partition or file)

In short, just tell me what should be removed, and I will happily remove it.

[1] https://www.reddit.com/r/chromeos/comments/y5pol9/anyone_know_what_the_status_of_hiberman_hibernate/
[2] https://pagure.io/fedora-workstation/blob/master/f/notes/hibernationstatus.md
[3] https://www.groovypost.com/howto/enable-hibernate-mode-windows-10/
[4] https://www.reddit.com/r/chromeos/comments/y5pol9/comment/ism352k/

-- 
Askar Safin
