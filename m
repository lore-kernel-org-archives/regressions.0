Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A554A25
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657746669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iFHpCyvAUj8PR3pT8ZuAHtStGix9rf3O5MA6mbdziHg=;
	b=PIHsrUrM+basyPGElsIEq2kMso8KdHih+Xx1Hq7r5l6tYOAT6fEADKoXCwmgFMvmanB+Q1
	AdhbXjGC+sOghbGHNpjzrdBJsRQiCG7HIBvMUeQzAMhZ32/s0al3LnV/1GkrKlvo2BjR+j
	wUlsj/zNyOi7qwMflyJLREFvNswv3fw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-IUXcygD8O064CeRXa8axtw-1; Wed, 13 Jul 2022 17:11:08 -0400
X-MC-Unique: IUXcygD8O064CeRXa8axtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB7CA811E75;
	Wed, 13 Jul 2022 21:11:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A66B1141510F;
	Wed, 13 Jul 2022 21:11:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-acpi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	regressions@lists.linux.dev,
	Ben Greening <bgreening@gmail.com>
Subject: [PATCH 0/1] ACPI: video: Fix acpi_video_handles_brightness_key_presses()
Date: Wed, 13 Jul 2022 23:11:00 +0200
Message-Id: <20220713211101.85547-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

Hi Rafael,

Commit 3a0cf7ab8df3 ("ACPI: video: Change how we determine if brightness
key-presses are handled") which fixes not sending any brightness
key-presses at all on some Panasonic models, because of
acpi_video_handles_brightness_key_presses() returning true while it
should not, is causing duplicate brightness key presses on some
(older) Dell models.

This patch fixes this. As mentioned in the commit message a down-side
of the fix is that the first brightness key-press on affected Dell models
might still get reported twice. The alternative would be DMI based quirks
and IMHO this generic fix is better.

Since I send the original commit to Linus through the pdx86 tree
as part of a panasonic-laptop driver fixes series, and since users
are reporting regressions because of the original fix now, I plan to
include this fix to the fix in my next fixes pull-req to Linus
this Friday.

If you have any objections against this fix please let me know
before Friday.

Regards,

Hans


Hans de Goede (1):
  ACPI: video: Fix acpi_video_handles_brightness_key_presses()

 drivers/acpi/acpi_video.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.36.0

