Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25D130A6D;
	Wed, 27 Mar 2024 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711553507; cv=none; b=cmiJirv5MmgUNwsXj8dHVnrMF0GcT2hUukHJUpiLMkWVu3HGxWL2scTKxlvo9ArxLqsFFC5gb0G3udGlB23Xv5ljiPhXi9SqJHemYQiWhVL/bZpuFxfnaMY/wEzPpHB5uPOvB0uh3Mz0DgQoAqJGq+uqIdHPRAMP5/sC1N2mBxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711553507; c=relaxed/simple;
	bh=o/XjqHPPxn8SwIHhADNnxxLXgvMJhzhnJUAcMoohRHM=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=M0hD8mxF8Sq0jdHd122GI0M8VxwtJb4yPBCOPv5eaB50KFt8dOuOIrzL5W5mkmL9m+sPKsF/RJJMMpZzk5+UyArwUq792G/QOdlDmqMkxFIpveIu/5xdq3PMsVgc/UKLQrVs+hJZ4b+FnKt/xHzWJKOuh7n257+xdRMnk+FxpM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=feuaIoos; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="feuaIoos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D91C433C7;
	Wed, 27 Mar 2024 15:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711553507;
	bh=o/XjqHPPxn8SwIHhADNnxxLXgvMJhzhnJUAcMoohRHM=;
	h=Subject:To:Cc:From:Date:From;
	b=feuaIoos+sZoKxLhgjkiyEy+tbLIGfKoHAngUFZa2c7ikrxkqwCbq/Sjv5DI7BN4s
	 SA7rPPn0b+yKycTs0i9YOaNbSs5nhSbuyRIYWSqeHiR8EKOBImsmwOW2GvP/NQHdr9
	 guAoZHwyqWJKAptI+GCGXqQTRGREqhIsLG1Ryx7g=
Subject: Patch "misc: lis3lv02d_i2c: Fix regulators getting en-/dis-abled twice on suspend/resume" has been added to the 6.7-stable tree
To: 5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de,gregkh@linuxfoundation.org,hdegoede@redhat.com,pmenzel@molgen.mpg.de,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 27 Mar 2024 16:28:33 +0100
Message-ID: <2024032733-tank-moonscape-b149@gregkh>
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

    misc: lis3lv02d_i2c: Fix regulators getting en-/dis-abled twice on suspend/resume

to the 6.7-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     misc-lis3lv02d_i2c-fix-regulators-getting-en-dis-abled-twice-on-suspend-resume.patch
and it can be found in the queue-6.7 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ac3e0384073b2408d6cb0d972fee9fcc3776053d Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Tue, 20 Feb 2024 20:00:35 +0100
Subject: misc: lis3lv02d_i2c: Fix regulators getting en-/dis-abled twice on suspend/resume

From: Hans de Goede <hdegoede@redhat.com>

commit ac3e0384073b2408d6cb0d972fee9fcc3776053d upstream.

When not configured for wakeup lis3lv02d_i2c_suspend() will call
lis3lv02d_poweroff() even if the device has already been turned off
by the runtime-suspend handler and if configured for wakeup and
the device is runtime-suspended at this point then it is not turned
back on to serve as a wakeup source.

Before commit b1b9f7a49440 ("misc: lis3lv02d_i2c: Add missing setting
of the reg_ctrl callback"), lis3lv02d_poweroff() failed to disable
the regulators which as a side effect made calling poweroff() twice ok.

Now that poweroff() correctly disables the regulators, doing this twice
triggers a WARN() in the regulator core:

unbalanced disables for regulator-dummy
WARNING: CPU: 1 PID: 92 at drivers/regulator/core.c:2999 _regulator_disable
...

Fix lis3lv02d_i2c_suspend() to not call poweroff() a second time if
already runtime-suspended and add a poweron() call when necessary to
make wakeup work.

lis3lv02d_i2c_resume() has similar issues, with an added weirness that
it always powers on the device if it is runtime suspended, after which
the first runtime-resume will call poweron() again, causing the enabled
count for the regulator to increase by 1 every suspend/resume. These
unbalanced regulator_enable() calls cause the regulator to never
be turned off and trigger the following WARN() on driver unbind:

WARNING: CPU: 1 PID: 1724 at drivers/regulator/core.c:2396 _regulator_put

Fix this by making lis3lv02d_i2c_resume() mirror the new suspend().

Fixes: b1b9f7a49440 ("misc: lis3lv02d_i2c: Add missing setting of the reg_ctrl callback")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/regressions/5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de/
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 15 7590
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Link: https://lore.kernel.org/r/20240220190035.53402-1-hdegoede@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/lis3lv02d/lis3lv02d_i2c.c |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

--- a/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
@@ -198,8 +198,14 @@ static int lis3lv02d_i2c_suspend(struct
 	struct i2c_client *client = to_i2c_client(dev);
 	struct lis3lv02d *lis3 = i2c_get_clientdata(client);
 
-	if (!lis3->pdata || !lis3->pdata->wakeup_flags)
+	/* Turn on for wakeup if turned off by runtime suspend */
+	if (lis3->pdata && lis3->pdata->wakeup_flags) {
+		if (pm_runtime_suspended(dev))
+			lis3lv02d_poweron(lis3);
+	/* For non wakeup turn off if not already turned off by runtime suspend */
+	} else if (!pm_runtime_suspended(dev))
 		lis3lv02d_poweroff(lis3);
+
 	return 0;
 }
 
@@ -208,13 +214,12 @@ static int lis3lv02d_i2c_resume(struct d
 	struct i2c_client *client = to_i2c_client(dev);
 	struct lis3lv02d *lis3 = i2c_get_clientdata(client);
 
-	/*
-	 * pm_runtime documentation says that devices should always
-	 * be powered on at resume. Pm_runtime turns them off after system
-	 * wide resume is complete.
-	 */
-	if (!lis3->pdata || !lis3->pdata->wakeup_flags ||
-		pm_runtime_suspended(dev))
+	/* Turn back off if turned on for wakeup and runtime suspended*/
+	if (lis3->pdata && lis3->pdata->wakeup_flags) {
+		if (pm_runtime_suspended(dev))
+			lis3lv02d_poweroff(lis3);
+	/* For non wakeup turn back on if not runtime suspended */
+	} else if (!pm_runtime_suspended(dev))
 		lis3lv02d_poweron(lis3);
 
 	return 0;


Patches currently in stable-queue which might be from hdegoede@redhat.com are

queue-6.7/ahci-asm1064-asm1166-don-t-limit-reported-ports.patch
queue-6.7/misc-lis3lv02d_i2c-fix-regulators-getting-en-dis-abled-twice-on-suspend-resume.patch
