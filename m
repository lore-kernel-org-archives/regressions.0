Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F2872
	for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 10:02:51 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id t17so8213606pga.5
        for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNQD4x8X3fqLopq7YlxB2amn3le3fNKisSEzfuWGwmk=;
        b=KsODG2p+0P7TzUkSGtY6l1BPl3iRfswiPFdZQxactpYuArBXPIkRUm6upHjC6LdNOh
         xbbN5+6kFwV+b14IfzU4ZbNpljF11z8KxifrIXCBWDGhOlzAScB8ft0Gj2pPeAkrKEoI
         1t9usoOwl0+TURy3AsUREHmYK9qzBAjJOaednhBf6v9GeLZLAYSBEDM6+Pb4XTNQoMJZ
         i7ZHxdJ8ayX7wtdjPujrE9YY8kmp7v0CTIXx0Qv1V7rs5PYDk5RWCk1t2GDTe1z/Hmon
         t7ZPdNY5/En/TKh6G/8mrPI9HAhlSfmqudiPAMp3Boy+oFGb8uuEDVqWROnxIlU0zsLd
         2w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNQD4x8X3fqLopq7YlxB2amn3le3fNKisSEzfuWGwmk=;
        b=YXMJvlfmlFMnV5ZCZ3vPbeR2TW7jhiiwHIJ+OzotgbzZ9wGsWMpAs+UQbEhPri0Uwr
         mPeBWAQBLcTD04iS8Ft8cyHq75UlOBWMKWZ2Rq8O6SnUXIxE0Fin3nwA1hO4HJjBwS2L
         tIkpfXJ9seBAzDeepf16OHNpvKbalv7jsBcj859UnDVa+J3yH0T3/rydjPMcQDXe8r/B
         WFYdIpSIAaYYwWo/LpaYxkczfTwqJq5nzynxnATcQuJCYo/yqQCpNlYEubzZYBc7xxa8
         mrWFc1i4ILrlSraOY3XRPwEyUDD5GkMI46Knv3t1clZaQX3PEbTy6SwisZxXCgWeIvUh
         6YnQ==
X-Gm-Message-State: AOAM5314nETkXlGJwfQT2wE7CJGt4yqOopgKCCRIBoj3lIkVc8wI41d6
	Vp0qEGlsT7yMKDUDOfC751g=
X-Google-Smtp-Source: ABdhPJznYWcNRclazSfMjDvL7XG0PCNfjNv0tmjFeg+HSzd1vhRPQW2g+gETCvqtBzX2rwbDieEAvg==
X-Received: by 2002:aa7:83c3:0:b029:2e8:f2ba:3979 with SMTP id j3-20020aa783c30000b02902e8f2ba3979mr21137727pfn.8.1623664971383;
        Mon, 14 Jun 2021 03:02:51 -0700 (PDT)
Received: from localhost.localdomain ([143.244.42.72])
        by smtp.gmail.com with ESMTPSA id x28sm12005906pff.201.2021.06.14.03.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 03:02:51 -0700 (PDT)
From: youling257 <youling257@gmail.com>
To: keescook@chromium.org
Cc: torvalds@linux-foundation.org,
	christian.brauner@ubuntu.com,
	andrea.righi@canonical.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] proc: Track /proc/$pid/attr/ opener mm_struct
Date: Mon, 14 Jun 2021 18:02:34 +0800
Message-Id: <20210614100234.12077-1-youling257@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608171221.276899-1-keescook@chromium.org>
References: <20210608171221.276899-1-keescook@chromium.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I used mainline kernel on android, this patch cause "failed to retrieve pid context" problem.

06-14 02:15:51.165  1685  1685 E ServiceManager: SELinux: getpidcon(pid=1682) failed to retrieve pid context.
06-14 02:15:51.166  1685  1685 E ServiceManager: add_service('batteryproperties',1) uid=0 - PERMISSION DENIED
06-14 02:15:51.166  1682  1682 I ServiceManager: addService() batteryproperties failed (err -1 - no service manager yet?).  Retrying...
06-14 02:15:51.197  1685  1685 E ServiceManager: SELinux: getpidcon(pid=1695) failed to retrieve pid context.
06-14 02:15:51.197  1685  1685 E ServiceManager: add_service('android.security.keystore',1) uid=1017 - PERMISSION DENIED
06-14 02:15:51.198  1695  1695 I ServiceManager: addService() android.security.keystore failed (err -1 - no service manager yet?).  Retrying...
06-14 02:15:51.207  1685  1685 E ServiceManager: SELinux: getpidcon(pid=1708) failed to retrieve pid context.
06-14 02:15:51.207  1685  1685 E ServiceManager: add_service('android.service.gatekeeper.IGateKeeperService',1) uid=1000 - PERMISSION DENIED
06-14 02:15:51.207  1708  1708 I ServiceManager: addService() android.service.gatekeeper.IGateKeeperService failed (err -1 - no service manager yet?).  Retrying...
06-14 02:15:51.275  1685  1685 E ServiceManager: SELinux: getpidcon(pid=1693) failed to retrieve pid context.
06-14 02:15:51.275  1692  1692 I cameraserver: ServiceManager: 0xf6d309e0
06-14 02:15:51.275  1685  1685 E ServiceManager: add_service('drm.drmManager',1) uid=1019 - PERMISSION DENIED
06-14 02:15:51.276  1693  1693 I ServiceManager: addService() drm.drmManager failed (err -1 - no service manager yet?).  Retrying...

