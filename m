Received: from bee.tesarici.cz (unknown [77.93.223.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F56089B
	for <regressions@lists.linux.dev>; Wed,  6 Mar 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.93.223.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709723543; cv=none; b=W30JrULtp/Y9zUHopyJXguExj0TbDOBP6eDtjpisvC5Jdq/W/xXhUgGT1aJFkZrgFNm1I+0EXc9ckAh20hYFkQOa3+y4IUK6E15BYZnKEJpYzVeMFzNwtLwr7T8ODhrnrImnuncNUlXFw8/XfKP5GXhLKyIOq5WJT3M7OmaUMHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709723543; c=relaxed/simple;
	bh=wmU/DUhfL3HovQWf0NwpKdiQKOYEvrY68QLwAtIMdKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lCfG0JaAWlfgbePkCSnrkSzgccuVm5NnNLJp0/McSZn+KWi1EXizsaklQdCCYdwoxw7+nkYdOJbLfSGr+0fBJ6A1e3ppHC9H4sI6KCryowjXRgFpwYiwqgsY6nPWYJWofIQIJAPkXAqRWTPH9DZ8PGXX9nDOIM9jYJ1+bnw3Mpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=ACUaXUva; arc=none smtp.client-ip=77.93.223.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="ACUaXUva"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 1771D1C964D;
	Wed,  6 Mar 2024 12:12:17 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1709723538; bh=v5JAMBrNDP5b7jIy8twzxHR53DVo5CONXkezKDhBooE=;
	h=From:To:Cc:Subject:Date:From;
	b=ACUaXUvacShu6y73ZneV5eg+QL4cfJNYceBIwSoDPbNHX/S+hKo9mNTsvadU5FzCv
	 14SRl4wTP5eNUFzlaTT7arH2x2HPMg8gFtbMLkl6CO1Mi3RQF/9TQTTpesOi7kjQXd
	 kPNCSZm5bR/shpSPPoFizvNNWNg/GBAVfyTBiMVonu3YmlHTMf4Od2oE4dj/0iVlC/
	 PzYf5qoY3tNK/sTwcUQfToDC2S5bfd42/gQ4EotR7buRprXn0HUFncRPON+TfkVNPY
	 M6yFuNvJ+0xvt7p5xZPmLir2+9wY8jbQqLrLU+atv1mPf8yz9CEVpkrcZ0MO10Kbtw
	 YrQa05SdLQn5Q==
From: Petr Tesarik <petr@tesarici.cz>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-kernel@vger.kernel.org (open list)
Cc: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	Petr Tesarik <petr@tesarici.cz>,
	stable@kernel.org
Subject: [PATCH 1/1] u64_stats: fix u64_stats_init() for lockdep when used repeatedly in one file
Date: Wed,  6 Mar 2024 12:11:57 +0100
Message-ID: <20240306111157.29327-1-petr@tesarici.cz>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bogus lockdep warnings if multiple u64_stats_sync variables are
initialized in the same file.

With CONFIG_LOCKDEP, seqcount_init() is a macro which declares:

	static struct lock_class_key __key;

Since u64_stats_init() is a function (albeit an inline one), all calls
within the same file end up using the same instance, effectively treating
them all as a single lock-class.

Cc: stable@kernel.org
Fixes: 9464ca650008 ("net: make u64_stats_init() a function")
Closes: https://lore.kernel.org/netdev/ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net/
Signed-off-by: Petr Tesarik <petr@tesarici.cz>
---
 include/linux/u64_stats_sync.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/u64_stats_sync.h b/include/linux/u64_stats_sync.h
index ffe48e69b3f3..457879938fc1 100644
--- a/include/linux/u64_stats_sync.h
+++ b/include/linux/u64_stats_sync.h
@@ -135,10 +135,11 @@ static inline void u64_stats_inc(u64_stats_t *p)
 	p->v++;
 }
 
-static inline void u64_stats_init(struct u64_stats_sync *syncp)
-{
-	seqcount_init(&syncp->seq);
-}
+#define u64_stats_init(syncp)				\
+	do {						\
+		struct u64_stats_sync *__s = (syncp);	\
+		seqcount_init(&__s->seq);		\
+	} while (0)
 
 static inline void __u64_stats_update_begin(struct u64_stats_sync *syncp)
 {
-- 
2.44.0

