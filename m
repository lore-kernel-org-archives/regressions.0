Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CCB376
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 00:58:03 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d8997e79faeso351227276.1
        for <regressions@lists.linux.dev>; Tue, 03 Oct 2023 17:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696381082; x=1696985882; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uThSy4yEdZygz3nx9AdT/+Ka5ZDArvLjVeK3y4dcvFg=;
        b=oyLqbJj/TtM4X69/gykypINUu3YnvNDAcS5xycRCqpP+9I//KFhUKy1/1ANTJSmcj0
         m9f5ZAj1sk22gpzuzwwTYmWLj/Fs2OBuuhZmP0aYRVlBQLmBY+FUQc3jvJ3egZWGjEm/
         yQE1Vl1YoqMAdG2fGiO2BY2ayJN8MuLejkHxEqFjSFQ4OdsFX4hp/MpKlE2i7INAbQU5
         4rUKoJ72LmUe9kreKPsWnnycI6nr6toMjz6XE2uvmX4goLkvh3edSQR3l/oIEjxhhNyI
         T/av358G59e/Ivpp65rS16CSBLub4a2JdbNKyNuyo34gJp1PlUT+AN2o6vPuRl8//NwL
         GCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696381082; x=1696985882;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uThSy4yEdZygz3nx9AdT/+Ka5ZDArvLjVeK3y4dcvFg=;
        b=bdfRAPbN5Gt6ERuHRCH/GE3LORu/lP/uRQSMcFeLxcG99abgcjE2P1UyaQH9BZU+WT
         uLvM75qzkWq17w8XhaCMXvZkwkvvmjeETYnULUbSWkmQm/I0bNAAdmunDooJwKj/ujE/
         jypN/h0xmfrnn2DmwhaV+dijFt44nmygYJx7RGPrYy4LrY45+NsCKIgjJHy/odmSeW8o
         LTs9YD/sCvqKoypHIyl6bcuTSx7XHh949hjzplntaIMtBTl9B8rh/UDXYw4gvLsVZqIl
         z6wO+2fq/ncxzFdtJG79A23l3wKLgSfU/4S0stUjT/kkAReJR/lhrzU6PGcOwM6SWcme
         9XAw==
X-Gm-Message-State: AOJu0YzTX8jQCJn7Z80+tI0JqbJEa39paBQA3R3hBb0ghPf1hZ/DLciQ
	Nk8014x403pcuxcH6iF1cTzELXHjq1GNEZr+ZTXr
X-Google-Smtp-Source: AGHT+IGMPS6riiI0T9ofgPM70mrTKqdYfgP6uvgJ51Ftij4XuTNLRixV8U6nH5DOAQqNufqzPO4Xi4IrIJQsw+E9dJwJ
X-Received: from horchata.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:5b3])
 (user=jefferymiller job=sendgmr) by 2002:a25:b8d:0:b0:d89:42d7:e72d with SMTP
 id 135-20020a250b8d000000b00d8942d7e72dmr82813ybl.3.1696381082437; Tue, 03
 Oct 2023 17:58:02 -0700 (PDT)
Date: Tue,  3 Oct 2023 19:57:24 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20231004005729.3943515-1-jefferymiller@google.com>
Subject: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
From: Jeffery Miller <jefferymiller@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: regressions@lists.linux.dev, benjamin.tissoires@redhat.com, 
	linux@leemhuis.info, Andrew Duggan <aduggan@synaptics.com>, 
	Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org, 
	Jeffery Miller <jefferymiller@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make `elantech_setup_ps2` set a compatible fast_reconnect pointer
when its ps2 mode is used.

When an SMBus connection is attempted and fails `psmouse_smbus_init`
sets fast_reconnect to `psmouse_smbus_reconnect`.
`psmouse_smbus_reconnect` expects `psmouse->private` to be
`struct psmouse_smbus_dev` but `elantech_setup_ps2` replaces
it with its private data. This was causing an issue on resume
since psmouse_smbus_reconnect was being called while in ps2, not SMBus
mode.

This was uncovered by commit 92e24e0e57f7 ("Input: psmouse - add delay when
deactivating for SMBus mode")

Closes:
Link:https://lore.kernel.org/all/ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info/
Reported-by: Thorsten Leemhuis <linux@leemhuis.info>

Signed-off-by: Jeffery Miller <jefferymiller@google.com>
---

The other callbacks set in psmouse_smbus_init are already replaced.
Should fast_reconnect be set to `elantech_reconnect` instead?


 drivers/input/mouse/elantech.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2118b2075f43..4e38229404b4 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -2114,6 +2114,7 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
 	psmouse->protocol_handler = elantech_process_byte;
 	psmouse->disconnect = elantech_disconnect;
 	psmouse->reconnect = elantech_reconnect;
+	psmouse->fast_reconnect = NULL;
 	psmouse->pktsize = info->hw_version > 1 ? 6 : 4;
 
 	return 0;
-- 
2.42.0.582.g8ccd20d70d-goog

