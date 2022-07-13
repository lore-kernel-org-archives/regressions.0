Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC394A25
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657746672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7rtE+Bk3sES4x0SarCTWMJ0nW8KkYc8L6tR25sLo1as=;
	b=BRazN9CZ9J6xgSLClvxt2yZV58lvdL9LkVmJblWCAh2exmkjjfdvm7VD5TNw4RM2Zl0j6a
	1+VyKppQKYSNdXSaN3uWDOWSWJFbtWi3N5Q8fwZGdKNzOBq2aUu/JX3sj9dOtbgNr8g/Gr
	o8IE+O9HrxkoW7pHm3OkhKsfWu2V5jE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-5585GaorND-YniR9TB9ygw-1; Wed, 13 Jul 2022 17:11:10 -0400
X-MC-Unique: 5585GaorND-YniR9TB9ygw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3D6729AA3AF;
	Wed, 13 Jul 2022 21:11:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B0EB141510F;
	Wed, 13 Jul 2022 21:11:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-acpi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	regressions@lists.linux.dev,
	Ben Greening <bgreening@gmail.com>
Subject: [PATCH] ACPI: video: Fix acpi_video_handles_brightness_key_presses()
Date: Wed, 13 Jul 2022 23:11:01 +0200
Message-Id: <20220713211101.85547-2-hdegoede@redhat.com>
In-Reply-To: <20220713211101.85547-1-hdegoede@redhat.com>
References: <20220713211101.85547-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

Commit 3a0cf7ab8df3 ("ACPI: video: Change how we determine if brightness
key-presses are handled") made acpi_video_handles_brightness_key_presses()
report false when none of the ACPI Video Devices support backlight control.

But it turns out that at least on a Dell Inspiron N4010 there is no ACPI
backlight control, yet brightness hotkeys are still reported through
the ACPI Video Bus; and since acpi_video_handles_brightness_key_presses()
now returns false, brightness keypresses are now reported twice.

To fix this rename the has_backlight flag to may_report_brightness_keys and
also set it the first time a brightness key press event is received.

Depending on the delivery of the other ACPI (WMI) event vs the ACPI Video
Bus event this means that the first brightness key press might still get
reported twice, but all further keypresses will be filtered as before.

Note that this relies on other drivers reporting brightness key events
calling acpi_video_handles_brightness_key_presses() when delivering
the events (rather then once during driver probe). This is already
required and documented in include/acpi/video.h:

/*
 * Note: The value returned by acpi_video_handles_brightness_key_presses()
 * may change over time and should not be cached.
 */

Fixes: 3a0cf7ab8df3 ("ACPI: video: Change how we determine if brightness key-presses are handled")
Link: https://lore.kernel.org/regressions/CALF=6jEe5G8+r1Wo0vvz4GjNQQhdkLT5p8uCHn6ZXhg4nsOWow@mail.gmail.com/
Reported-by: Ben Greening <bgreening@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 43177c20ce4f..eaea733b368a 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -73,7 +73,7 @@ module_param(device_id_scheme, bool, 0444);
 static int only_lcd = -1;
 module_param(only_lcd, int, 0444);
 
-static bool has_backlight;
+static bool may_report_brightness_keys;
 static int register_count;
 static DEFINE_MUTEX(register_count_mutex);
 static DEFINE_MUTEX(video_list_lock);
@@ -1224,7 +1224,7 @@ acpi_video_bus_get_one_device(struct acpi_device *device,
 	acpi_video_device_find_cap(data);
 
 	if (data->cap._BCM && data->cap._BCL)
-		has_backlight = true;
+		may_report_brightness_keys = true;
 
 	mutex_lock(&video->device_list_lock);
 	list_add_tail(&data->entry, &video->video_device_list);
@@ -1693,6 +1693,9 @@ static void acpi_video_device_notify(acpi_handle handle, u32 event, void *data)
 		break;
 	}
 
+	if (keycode)
+		may_report_brightness_keys = true;
+
 	acpi_notifier_call_chain(device, event, 0);
 
 	if (keycode && (report_key_events & REPORT_BRIGHTNESS_KEY_EVENTS)) {
@@ -2253,7 +2256,7 @@ void acpi_video_unregister(void)
 	if (register_count) {
 		acpi_bus_unregister_driver(&acpi_video_bus);
 		register_count = 0;
-		has_backlight = false;
+		may_report_brightness_keys = false;
 	}
 	mutex_unlock(&register_count_mutex);
 }
@@ -2275,7 +2278,7 @@ void acpi_video_unregister_backlight(void)
 
 bool acpi_video_handles_brightness_key_presses(void)
 {
-	return has_backlight &&
+	return may_report_brightness_keys &&
 	       (report_key_events & REPORT_BRIGHTNESS_KEY_EVENTS);
 }
 EXPORT_SYMBOL(acpi_video_handles_brightness_key_presses);
-- 
2.36.0

