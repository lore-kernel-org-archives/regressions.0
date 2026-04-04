Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE61BD9C9
	for <regressions@lists.linux.dev>; Sat,  4 Apr 2026 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775312922; cv=none; b=GsugywU3dc3ySQ9abaH66l4uWvtNvVIkIk7pZ60NMHHsR3u+tm8TSuvAvZ2/41Q0SWKRtumCTpfiN3UkFq6UHGk4MKbfh8T295WcjlLp5ko4UFQ/tsDAiuuqfYxB0Ms4goQY3vlBgyCgmSWKWW3lFdH6oOG+PPZW/mnWZ34hVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775312922; c=relaxed/simple;
	bh=2Up/ooB1F1IW8Et3iiWgK6r3LpYS5a02mdN+3AgSDSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xk2lKpDQ9jm3rgecdEtImLfcD0ia6NhScDT5oQRGml/aeCHk5gRvSSDzAmTptWtoJZfLCeDjSVzq7NLt7E7T6WTJoztqwsHqHvZSZAh9XqeoQDKXngNQtrmUDxHgS7UcUo05G0kN7WfWmv8HWr9wvNwC++QYomVxxEdPzleWYpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RckBnhQ4; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RckBnhQ4"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d424af6282so200110885a.0
        for <regressions@lists.linux.dev>; Sat, 04 Apr 2026 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775312919; x=1775917719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QW+xJnpJU8nKA23Wo9lc4Fv12FM04P5h1eCRyd3g/I=;
        b=RckBnhQ4JXfsliMJbfOcWEtAw2+pP3VkT4+qeGKPH/OjJLJ7hPZgLiBR8AAjlVyJNZ
         SxRA4Uwxn4std2Y0Sae1yMkXtyo2dnStB50HSzLO2+HooIho7OUjO/ox1FPKFk5MJMrD
         nYIhiz1TxUQNVv3wkysHkvyvo1uDMw0V+eA6/UUpaWEtjjaAYNzF7/ND67SsIqkHBANn
         u1/bUwxSu9if2Td3Ly3SuF3LvhjLE/qSxdftLu6XviirKhRzK6O6YDvntWRTnOEYHVmJ
         ef9RrqkJDSNj57z22+kLDEYbR+bnnHtalIRjLK9VXmNNZUzLEyTlL2UFfxXyb+CRgIVS
         m5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775312919; x=1775917719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/QW+xJnpJU8nKA23Wo9lc4Fv12FM04P5h1eCRyd3g/I=;
        b=OhiH5DZx4L6QfWIg3zMcgbpHs+sNddwPKiugsaOvgi+kaJYJv9jG7iHq5QFYhDkjGu
         inH9aFqZtcDfUKYm2hr1WSsmO20C5dbRTUHpe20/+jkHLiJEpQ/6T0eybb4u6PsKY7i6
         YD3sTH29hxHA59F3+JXWpZGpmhg/NX/DPtBPX16nfgUhWRq6uWEkXtGU5RyEa/t+xKPk
         XGbH4z+jF4ihE9HQxr5DU/IADyKbaobFm0wpm0a6Tn3yxWbGah5AhYGXYtUe9yp9/T0b
         Pmx4lX4OQReoLJRY26HqrM/mqqwdsM4oWqd1OJVa4tRnfJGzqy3iVEmj0X3y8ht1LklU
         Z3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkSyBmgnUhyl2TQfTHLH0JM7LN6c0NuVC8DoVD/MIS/NaXWlas6jiGeHrd0yVU4qiw5upsBWwQNE8syA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoJZbuQXqkK5cgDOjTf2d897x7eGRfmGdK5QxRxBnP/Sr9/rGS
	hXPxbq1LT0ZiL1huRj1EG+kkdV6u2XFd2AEMNfuEeozFDGdOj7dbxBJK
X-Gm-Gg: AeBDievHcZDH7zg0vXjbl4LKddUX1wvhcZQJst0J7Y3T3FRNvsjAfIiwIvVmwLtJLci
	xoHZaRF5UmQ194du/G//9JdTfI0bSLws3SOnFTMpdVf2lU3wzRDZvcGqzyGnQiHF3i15ruTQ/kr
	usK3fkXpaOBjo4xi9Q+6uMuLBSVZrJWxgPEs1gQ+YZwM5ORu8Emoodvti4HVb+vA/Oq5YnmzhT+
	zV5jNem22gmATTEzSjbl7vdFMC89VRIgjVTrlAkoSVlLRWNKTA8+pmq66SFy426MQrr2kMdD09b
	auO9DE3XbWH4xYqIm7rmj47hmHvVTRIkTlyxY2y91SJDWkNF7ogMvsb8J9Vc/qDZRn6cK1lueT7
	LnXuTNbL5Vb3wuesswC5SYzGkcoKuTAPMmpSmMfRvqys7R5NhhvlKnsFmiYxGkQTPlAvXzwX4ZM
	aBCnnhF5i+ZgW3zF3CdIdjh4rNvjTZAapdzjm/IC9vyyI=
X-Received: by 2002:a05:620a:1788:b0:8cf:dfc9:c099 with SMTP id af79cd13be357-8d4185cd9e7mr987243085a.14.1775312918600;
        Sat, 04 Apr 2026 07:28:38 -0700 (PDT)
Received: from desktop.. ([2607:fea8:d681:2400:e8ee:54ba:50d9:dea6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d4b24ea458sm299111085a.9.2026.04.04.07.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 07:28:37 -0700 (PDT)
From: Tushar Sariya <tushar.sariya77@gmail.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	carnil@debian.org,
	maik.nergert@uni-hamburg.de,
	valentin.samir@magellium.fr,
	regressions@lists.linux.dev,
	Tushar Sariya <tushar.97@hotmail.com>
Subject: [PATCH v2 0/1] NFSv4.1: Apply session size limits on clone path
Date: Sat,  4 Apr 2026 11:58:02 -0230
Message-ID: <20260404142831.3341498-1-tushar.sariya77@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <177349021750.3039212.10211295677877269201@eldamar.lan>
References: <177349021750.3039212.10211295677877269201@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tushar Sariya <tushar.97@hotmail.com>

The NFS automount clone path (nfs4_clone_server) is missing the
session-size clamping that top-level mounts get in
nfs4_server_common_setup(). This was exposed by 2b092175f5e3 which
changed submounts to no longer unconditionally inherit the parent's
already-clamped rsize/wsize. On servers that enforce tight
max_request_size budgets (reported on Dell EMC Isilon/OneFS), the
child mount ends up with raw unclamped values that exceed the session
channel limits, resulting in NFS4ERR_REQ_TOO_BIG and user-visible EIO.

Note: I was unable to reproduce the exact failure locally as it appears
to require a server that enforces tight max_request_size budgets. The
fix is based on code analysis — the clone path is missing the same
session-limit clamping that top-level mounts apply in
nfs4_server_common_setup(). Tested that the kernel builds and boots
successfully.

Tushar Sariya (1):
  NFSv4.1: Apply session size limits on clone path

 fs/nfs/internal.h   | 2 ++
 fs/nfs/nfs4client.c | 4 ++--
 fs/nfs/nfs4proc.c   | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

--
2.43.0

