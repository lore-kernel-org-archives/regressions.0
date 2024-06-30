Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937A6BFD4
	for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719775245; cv=none; b=dxxFdqVxOKZXFtW+4jOzQ6OVnwP/+Zf4Z9bPWDZw1kvzXYwzVM4pySChcFPeeDLlPKiuvRxKiUCwPip2Lg1qRu9A+8mJRKMXCSksXCACc3B6w0NyLkKwHKMSzoJLIvBRinhId3lKEaYejUEHWnvd4xjWfXAcFOkJwJc524LfPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719775245; c=relaxed/simple;
	bh=Qv5LzdKpU0FwSK3HEaxfNczRepA3qdua1Igc7iJvxXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j+TR4ie38W2E9ZH87/QJGIqybxwyJ/UpMXYkMSYl6CFeGHZcvRsdzsoiWMIqVkgEtY6iHnZCkpnmwJSSFt+NgdOqM9KJu6azmaWTW812246CJmqdFq47DqigawwHlYQFHeenI2+O4LTtQGT+xy7W0exGvtQAl25b1/HBX34rcb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwhSNTDp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwhSNTDp"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70abb539f41so396459b3a.2
        for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719775242; x=1720380042; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qv5LzdKpU0FwSK3HEaxfNczRepA3qdua1Igc7iJvxXE=;
        b=SwhSNTDppf5UDMghAvDsPqmGzKC5UNH8/k831JSK3fh2+UiutoLuVY2AuFRo0IAIqD
         fAN6/lo7jAR9JUfqtsgjSuQic2nMIqnm2FvKpkcvGdgdCi6LxVh9fsgZ/PN6n5zah7kj
         WN8hdKl9k3ldy4MRFywtMZE8544lSZtWAIuCbtqIz/y075HfDOBpPc0Y6r9iC1+KjI21
         PVFewGw0nH/6cVrM7a4aufS1D+jAbB4j8+y0ItiEpjHVG3MU4IO4xWvIJcJoBGEarjMo
         S7lCZSzurPkMujstSDtNfP5A960lokZb5rhcay0PsuPIUxoN9Jxvm+bniUsABglnCYec
         ooCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719775242; x=1720380042;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qv5LzdKpU0FwSK3HEaxfNczRepA3qdua1Igc7iJvxXE=;
        b=ddqYCLEp8MPQ7NcHowa5v4e6OpygsLsyA43pGUv9RpXBMUWbZaS96fwr0zw4iOsv5K
         8P3hVjP5vc1IavpOrW8asq2CQnbl1wFREbg06iy5/gQlDUw/Z+1vFLQ5LyBMZe52FUN5
         xXLASvpkcOJci0XoY70IEf8PqCMVRyMh83l3zbilTDwglhDP7I+KN/aTklHzrz36+PYs
         TMb4sPud7mFR+QKyc/9ao+JmjCr+14uLHJtCohkn/5F878hSKT5IZ3JCP805ZoTyD41x
         qpji4/OoDbULcM/cLx3CpQhPRVNjga8GA+8hRV57b2HdP+Fuj0jAQiKL1Lvt0wjbRFQO
         jB9g==
X-Forwarded-Encrypted: i=1; AJvYcCUb2k2dIpRrU9GFeyNIe554mmeuGqY/RHgYfXsByDdIhDt2GMlmoYLKWSfkRY9sX9e18x1IpAbvT0W1vXj7JShRmiascyI8Sd7BZrc=
X-Gm-Message-State: AOJu0Yz9T+tG9h9mVYbvmwHWq+GDmadct/ZfK6Knza1uRNRV+o2EGpVk
	+e7y8qX0/arikrbROfzMTgdLld0PmnQfKH6/Qg2Y58wxskvD8UxBodDHCJQd
X-Google-Smtp-Source: AGHT+IEHp0UF3jlsTfprDPDQX8sR2LD15VGCEXaWu+GirQ9r41g5WgmKyIXx/EIMn1x1gMloMjq9dQ==
X-Received: by 2002:a05:6a20:8414:b0:1be:c2df:3ecf with SMTP id adf61e73a8af0-1bef6216ebamr6672498637.48.1719775241828;
        Sun, 30 Jun 2024 12:20:41 -0700 (PDT)
Received: from terra ([122.171.22.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e63ab1sm4979153b3a.36.2024.06.30.12.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:20:41 -0700 (PDT)
From: Forty Five <mathewegeorge@gmail.com>
To: Forty Five <mathewegeorge@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Bernie Huang
 <phhuang@realtek.com>, "kvalo@kernel.org" <kvalo@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: [REGRESSION] Freeze on resume from S3 (bisected)
In-Reply-To: <875xtqjli4.fsf@gmail.com>
References: <875xtqjli4.fsf@gmail.com>
Date: Mon, 01 Jul 2024 00:50:37 +0530
Message-ID: <87a5j2s0e2.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Forty Five <mathewegeorge@gmail.com> writes:

> I applied both patches on the latest master; here are the crash logs.

Just realized I forgot to run the commands to get debug messages for all
except the first crash log (kdumpst-202406301756.zip). I'll send more
logs later.
