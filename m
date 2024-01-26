Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535081D527
	for <regressions@lists.linux.dev>; Fri, 26 Jan 2024 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706285269; cv=none; b=T1BO9nqR94ScnhfP9YkNkFrX+7ool4wV9zDed/peqiX34AH70GXnubXPBZoVdty+Tqr81yIe6xu6oD6s2JNe83FPCLzc8J5TSkEq6t0+im3X5X51oDbGx/vhKGKzWzK3Ll4a4MNYrrlcQ2A62PHZLWcuLag+d5CLZy/BuhNzsoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706285269; c=relaxed/simple;
	bh=msl+pRuD5P5zFRlWMH/aDgd0LBjVTJdc7AoKbctMcIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HL0MzqEAFc4+2UavCdVTd2EoZG4suzVIV1b6c/XdztrGQhBlaYq5fEl/beVwyQ8Uwnfk9xiBx6ccLxoGMxKrhgqRkSQqCPmAVUft3KCXEN61/dG63WhncXooaFcUf73iA16wywxMG7UbuPT4rbJW53Kiaj/vIVFRguLEdVzYH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OAbW4H0B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OAbW4H0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706285267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XXP9w7kKPlYEgTmtrjAIjtvem/ro/F62xr2HXJTsCE=;
	b=OAbW4H0BdP2k5+Trb+lIkrPVuIwdmyEvakWJuOrFi8JNhUBIRWNoJF4KIuU9SlvsONHV4C
	3TArwNnWrtumoIjg6PCHlJx+KhHB6ep9Yhx2Xg0wer9YcX1TB1OL5ifLpk5FioXGzdzbZE
	JnMDFSDoQRl43EHRgTWa+M/pFVguu3s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-536-u-Ek7JKpOxCuqokkglN2uQ-1; Fri,
 26 Jan 2024 11:07:45 -0500
X-MC-Unique: u-Ek7JKpOxCuqokkglN2uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AE7D383CD7A;
	Fri, 26 Jan 2024 16:07:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4BB6111D65B;
	Fri, 26 Jan 2024 16:07:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH regression fix 2/2] Input: atkbd - Do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID
Date: Fri, 26 Jan 2024 17:07:24 +0100
Message-ID: <20240126160724.13278-3-hdegoede@redhat.com>
In-Reply-To: <20240126160724.13278-1-hdegoede@redhat.com>
References: <20240126160724.13278-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
translated mode") not only the getid command is skipped, but also
the de-activating of the keyboard at the end of atkbd_probe(), potentially
re-introducing the problem fixed by commit be2d7e4233a4 ("Input: atkbd -
fix multi-byte scancode handling on reconnect").

Make sure multi-byte scancode handling on reconnect is still handled
correctly by not skipping the atkbd_deactivate() call.

Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/keyboard/atkbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index c229bd6b3f7f..7f67f9f2946b 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -826,7 +826,7 @@ static int atkbd_probe(struct atkbd *atkbd)
 
 	if (atkbd_skip_getid(atkbd)) {
 		atkbd->id = 0xab83;
-		return 0;
+		goto deactivate_kbd;
 	}
 
 /*
@@ -863,6 +863,7 @@ static int atkbd_probe(struct atkbd *atkbd)
 		return -1;
 	}
 
+deactivate_kbd:
 /*
  * Make sure nothing is coming from the keyboard and disturbs our
  * internal state.
-- 
2.43.0

