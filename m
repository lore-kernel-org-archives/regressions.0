Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5703BEC7;
	Mon, 26 Feb 2024 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950862; cv=none; b=BWhXpGACoYX1kzrYAmNT1qbQO6bXcwsTdtLimt1Pc/Ny+vZz7mDKgJr9ajcrMs8j7lYXOWgbA4CZbN05hx0w5Ssbj03Cn++ca3QT/EozQADZn17u1eASxJ0mx5lshW/oCt0wNIc04Q1FGdXidlM6qnFo+62JDAyXHszdL42XPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950862; c=relaxed/simple;
	bh=hNxtXysqscMMMhrpe/FoN3wBgMgG0GppPwEKWu2JOro=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=XhvV9S87Px5VZv65Flq4ua3zIbmykqdvq4Vux/HRmiIL5mwtT0x63ABVngtW8SSTmMHOSO0RJCp8eZAm3PSeNoXhojfQxrSbFOV99vI3Lz4OECsf8619ZK/ryEF7sIyZ3DAQwRoMMfz9Yh1U3toHPlg1B1EvgmLGWrGnAfONEXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t4NTwy9y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t4NTwy9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC81CC433C7;
	Mon, 26 Feb 2024 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708950862;
	bh=hNxtXysqscMMMhrpe/FoN3wBgMgG0GppPwEKWu2JOro=;
	h=Subject:To:Cc:From:Date:From;
	b=t4NTwy9yM8zqwduHCX7foxJ+uRJC/zap+ARUY2pmv9tqE+m/3LsElFY91yfBFHDZQ
	 CT8quIZbYZ7SPhmWvMxqnOJnZPJjTHrNCa0taZYWJQbA+d12JxWxrCYFo6vJLKC/jU
	 p8O0mIRBPFo5EB+CPljgaJ9XWdbQtvTuLaq1iSLM=
Subject: Patch "platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler" has been added to the 6.1-stable tree
To: 295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de,a-kobel@a-kobel.de,arngozum@gmail.com,gregkh@linuxfoundation.org,hdegoede@redhat.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 26 Feb 2024 13:33:16 +0100
Message-ID: <2024022615-upchuck-aqueduct-45bb@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     platform-x86-intel-vbtn-stop-calling-vbdl-from-notify_handler.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 84c16d01ff219bc0a5dca5219db6b8b86a6854fb Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 16 Feb 2024 21:33:00 +0100
Subject: platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler

From: Hans de Goede <hdegoede@redhat.com>

commit 84c16d01ff219bc0a5dca5219db6b8b86a6854fb upstream.

Commit 14c200b7ca46 ("platform/x86: intel-vbtn: Fix missing
tablet-mode-switch events") causes 2 issues on the ThinkPad X1 Tablet Gen2:

1. The ThinkPad will wake up immediately from suspend
2. When put in tablet mode SW_TABLET_MODE reverts to 0 after about 1 second

Both these issues are caused by the "VBDL" ACPI method call added
at the end of the notify_handler.

And it never became entirely clear if this call is even necessary to fix
the issue of missing tablet-mode-switch events on the Dell Inspiron 7352.

Drop the "VBDL" ACPI method call again to fix the 2 issues this is
causing on the ThinkPad X1 Tablet Gen2.

Fixes: 14c200b7ca46 ("platform/x86: intel-vbtn: Fix missing tablet-mode-switch events")
Reported-by: Alexander Kobel <a-kobel@a-kobel.de>
Closes: https://lore.kernel.org/platform-driver-x86/295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de/
Cc: regressions@lists.linux.dev
Cc: Arnold Gozum <arngozum@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Alexander Kobel <a-kobel@a-kobel.de>
Link: https://lore.kernel.org/r/20240216203300.245826-1-hdegoede@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/intel/vbtn.c |    3 ---
 1 file changed, 3 deletions(-)

--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -200,9 +200,6 @@ static void notify_handler(acpi_handle h
 	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
 
 	sparse_keymap_report_event(input_dev, event, val, autorelease);
-
-	/* Some devices need this to report further events */
-	acpi_evaluate_object(handle, "VBDL", NULL, NULL);
 }
 
 /*


Patches currently in stable-queue which might be from hdegoede@redhat.com are

queue-6.1/platform-x86-touchscreen_dmi-add-info-for-the-teclas.patch
queue-6.1/ahci-asm1166-correct-count-of-reported-ports.patch
queue-6.1/platform-x86-intel-vbtn-stop-calling-vbdl-from-notify_handler.patch
queue-6.1/input-goodix-accept-acpi-resources-with-gpio_count-3.patch
queue-6.1/platform-x86-touchscreen_dmi-allow-partial-prefix-matches-for-acpi-names.patch
