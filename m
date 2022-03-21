Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69A1612C
	for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 18:44:32 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j18so12319774wrd.6
        for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 11:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=axQy2qCAlsIoCv1hQbGH/v2b+oq9maOH1YETcxdSZxg=;
        b=fT6kxIzW8ZZFIk0vIyx/K+RXK/LNnjWhKg6LbNDZgLrANujlVUA1QcGw+Ct7yILkXV
         dMIKchd1WFdj5qNCDxsDbNGYxlapSBSPxBZwHEhlCNHqqcYktrKAX6OzUplUpLGwTe5K
         yapGBJZ6uH5p+EK29VpxiU1O4Act+B3Zh14aSXP5t4kst0nP1SBf0LpuBdHs3FuTGrYI
         YG3gpytp0hE/fIx8cply7IwFX+eE19Ajn46q8nBzyKsL75ZwIRF/OBaeADiJwEZBtP3z
         KLVih/97h8FJdBBQM3gXYK6cCBVlYnDZy4s/y68/ySu6s4xROvZq/mHoWc79cSydKU0V
         tATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=axQy2qCAlsIoCv1hQbGH/v2b+oq9maOH1YETcxdSZxg=;
        b=Xpnnu2h9a1Mzo0RlvO4norJTsefaghMAf9otNiYAwvdWfaqjcfav1U69h+lFy72Uno
         /jHP8D4QpNCRgOA8XCgavlQWmDW1Ap//fS91aafDxEQrpjy7tDmvf8JC7irQ67otem2+
         oIrnSBObR3yyHiy81lCXNW4l4Gl7LOdmIb0Go0s4c1orMARjkRckoB85xPMzmfML+K7n
         u9ZCiDtWw+Eog4uP3QZ54XanUGy1/ZwH7fNgYsy4PFxKaFD4mjUZqtmdQZkjctVZNP2T
         R52sW/B1mD0kfamOPhB+vXZ/cFUhyiBj3okP7EBqtZjxJVAearMvlbVrTh8UrnfZx+rF
         5nog==
X-Gm-Message-State: AOAM531R6VMa8upCptJfovuKaghdX2Z52zKHk2WEAnVq563evoqPraME
	d+zVwdmBQ7x0xPwODklzD4A=
X-Google-Smtp-Source: ABdhPJwRzhfvjJOb6bd7r48CKzEi3Hf4OPM9hQwbEVugGwqkCg35GRpj6uJxNKi760osgbPDTqzwhw==
X-Received: by 2002:a5d:6e8e:0:b0:1e6:754b:47de with SMTP id k14-20020a5d6e8e000000b001e6754b47demr19609439wrz.208.1647888270918;
        Mon, 21 Mar 2022 11:44:30 -0700 (PDT)
Received: from localhost.localdomain ([94.73.33.246])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b0037bb8df81a2sm301886wmp.13.2022.03.21.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 11:44:30 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jkosina@suse.cz
Cc: tiwai@suse.de,
	benjamin.tissoires@redhat.com,
	regressions@leemhuis.info,
	peter.hutterer@who-t.net,
	linux-input@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"
Date: Mon, 21 Mar 2022 19:44:05 +0100
Message-Id: <20220321184404.20025-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 37ef4c19b4c659926ce65a7ac709ceaefb211c40.

The touchpad present in the Dell Precision 7550 and 7750 laptops
reports a HID_DG_BUTTONTYPE of type MT_BUTTONTYPE_CLICKPAD. However,
the device is not a clickpad, it is a touchpad with physical buttons.

In order to fix this issue, a quirk for the device was introduced in
libinput [1] [2] to disable the INPUT_PROP_BUTTONPAD property:

	[Precision 7x50 Touchpad]
	MatchBus=i2c
	MatchUdevType=touchpad
	MatchDMIModalias=dmi:*svnDellInc.:pnPrecision7?50*
	AttrInputPropDisable=INPUT_PROP_BUTTONPAD

However, because of the change introduced in 37ef4c19b4 ("Input: clear
BTN_RIGHT/MIDDLE on buttonpads") the BTN_RIGHT key bit is not mapped
anymore breaking the device right click button and making impossible to
workaround it in user space.

In order to avoid breakage on other present or future devices, revert
the patch causing the issue.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/481 [1]
Link: https://bugzilla.redhat.com/show_bug.cgi?id=1868789  [2]
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/input/input.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index c3139bc2aa0d..ccaeb2426385 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2285,12 +2285,6 @@ int input_register_device(struct input_dev *dev)
 	/* KEY_RESERVED is not supposed to be transmitted to userspace. */
 	__clear_bit(KEY_RESERVED, dev->keybit);
 
-	/* Buttonpads should not map BTN_RIGHT and/or BTN_MIDDLE. */
-	if (test_bit(INPUT_PROP_BUTTONPAD, dev->propbit)) {
-		__clear_bit(BTN_RIGHT, dev->keybit);
-		__clear_bit(BTN_MIDDLE, dev->keybit);
-	}
-
 	/* Make sure that bitmasks not mentioned in dev->evbit are clean. */
 	input_cleanse_bitmasks(dev);
 
-- 
2.25.1

