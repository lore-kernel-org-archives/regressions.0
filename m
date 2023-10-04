Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B215EB1
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 14:11:20 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-775810b032aso149469585a.1
        for <regressions@lists.linux.dev>; Wed, 04 Oct 2023 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696428679; x=1697033479; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksUh+jrzzPybnoiQtQr0hrHzGQz1wGgqWI8u8Q1EWwE=;
        b=I/8jz1OdMSWmiIuy6jctJwAmIA31YYs8xBhyEGy4QiN+L/NmoHLOtJBZbw2Te1k0jN
         ddEKaNvA8YjKhUsG4WFwK2j+ipCcMg0BxvxGybDH773ooxbunEiIMsClPTdYVJK5ezCY
         o+m7E4Xz1q3X44QfrZGUptHWDiaUFHsdxtET8aG1oIP9k71sZXIECmDlwUj8Sw9xvPA0
         75SvsUX+66J3Fo/sTLC8UeD4qAo8ZsmdcjfxKZZCbV1Kcyesr9TrMN6TXfHk7buVKDwW
         Fr2Y7JajhngdIOXKR2V43PidITWGIKwLorfoSZR4LSsVAjrfaGU3QO+8CO2bVixAKqjz
         RuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696428679; x=1697033479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksUh+jrzzPybnoiQtQr0hrHzGQz1wGgqWI8u8Q1EWwE=;
        b=IUdKPRxOmaGbD+Bdg/+GVul+GPU75JJmYfBaeihtx7d0atq50IshMMLPQJ8d18SHYs
         jbGHe/8y6zo4bwo4QZn+3K+CU13tOl0tu1k+4Ruo9lwcen22xPnj4wTZMYYVnnNIGyuI
         8yxlkk1ryH41/97KBdv8dkCRROLAST1Sp5R2M7XJpTDutcaPmoOVy29ov4H+sgkYIR+r
         hnCi4J0gtc2NDkC2yYirgqXbeFyoLYlCkOvsYlIFsJfh+NUpPgYFiWfLqCA+CRIkthFx
         YE1XUagHASQhwM7lnGgN4pMLm5UtCRynfRLDz4bMXdyMkQIxhwcW7PByCPpLo5AD/xGs
         LCGw==
X-Gm-Message-State: AOJu0Yx4HKsmLB81y6JtP+o00cdF6lIbb9vqOIhBH4fQWGelVGSpgDy6
	lX1i/3S7XFCUYD+o8+f3Sbc=
X-Google-Smtp-Source: AGHT+IH/IAS+d9I4qWoXCuKpcuQ84RN9Tb4+vrGL/0GIxBtw8qst5tubQ93uWZKgmvywJp8KC+EXZA==
X-Received: by 2002:a05:620a:2911:b0:773:b62b:3474 with SMTP id m17-20020a05620a291100b00773b62b3474mr2532251qkp.63.1696428678933;
        Wed, 04 Oct 2023 07:11:18 -0700 (PDT)
Received: from penguin ([205.220.129.20])
        by smtp.gmail.com with ESMTPSA id op52-20020a05620a537400b0076d9e298928sm1286326qkn.66.2023.10.04.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:11:18 -0700 (PDT)
Date: Wed, 4 Oct 2023 07:10:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeffery Miller <jefferymiller@google.com>
Cc: regressions@lists.linux.dev, benjamin.tissoires@redhat.com,
	linux@leemhuis.info, Andrew Duggan <aduggan@synaptics.com>,
	Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
Message-ID: <ZR1yUFJ8a9Zt606N@penguin>
References: <20231004005729.3943515-1-jefferymiller@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004005729.3943515-1-jefferymiller@google.com>

Hi Jeffery,

On Tue, Oct 03, 2023 at 07:57:24PM -0500, Jeffery Miller wrote:
> Make `elantech_setup_ps2` set a compatible fast_reconnect pointer
> when its ps2 mode is used.
> 
> When an SMBus connection is attempted and fails `psmouse_smbus_init`
> sets fast_reconnect to `psmouse_smbus_reconnect`.
> `psmouse_smbus_reconnect` expects `psmouse->private` to be
> `struct psmouse_smbus_dev` but `elantech_setup_ps2` replaces
> it with its private data. This was causing an issue on resume
> since psmouse_smbus_reconnect was being called while in ps2, not SMBus
> mode.
> 
> This was uncovered by commit 92e24e0e57f7 ("Input: psmouse - add delay when
> deactivating for SMBus mode")

Nice find, thank you.

> 
> Closes:
> Link:https://lore.kernel.org/all/ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info/
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> 
> Signed-off-by: Jeffery Miller <jefferymiller@google.com>
> ---
> 
> The other callbacks set in psmouse_smbus_init are already replaced.
> Should fast_reconnect be set to `elantech_reconnect` instead?

No, doing PS/2 Elantech reinitialization is not a "fast" operation, as
it takes a while to communicate with/query the device, so we should not
be using elantech_reconnect() as a "fast" reconnect handler.

In fact, now that I think about it more, we should rework the original
patch that added the delay, so that we do not wait these 30 msec in the
"fast" reconnect handler. It turns out your original approach was
better, but we should not be using retries, but rather the existing
reset_delay_ms already defined in rmi platform data. I would appreciate
if you try the draft patch at the end of this email (to be applied after
reverting your original one adding the delay in psmouse-smbus.c).

> 
> 
>  drivers/input/mouse/elantech.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 2118b2075f43..4e38229404b4 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -2114,6 +2114,7 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
>  	psmouse->protocol_handler = elantech_process_byte;
>  	psmouse->disconnect = elantech_disconnect;
>  	psmouse->reconnect = elantech_reconnect;
> +	psmouse->fast_reconnect = NULL;

I think we need a similar change in synaptics.c as that one also can
fall back to PS/2 mode.

Thanks!

---

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index ada299ec5bba..6ccc4a099b51 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -1752,6 +1752,7 @@ static int synaptics_create_intertouch(struct psmouse *psmouse,
 		psmouse_matches_pnp_id(psmouse, topbuttonpad_pnp_ids) &&
 		!SYN_CAP_EXT_BUTTONS_STICK(info->ext_cap_10);
 	const struct rmi_device_platform_data pdata = {
+		.reset_delay_ms = 30,
 		.sensor_pdata = {
 			.sensor_type = rmi_sensor_touchpad,
 			.axis_align.flip_y = true,
diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 7059a2762aeb..b0b099b5528a 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -235,12 +235,29 @@ static void rmi_smb_clear_state(struct rmi_smb_xport *rmi_smb)
 
 static int rmi_smb_enable_smbus_mode(struct rmi_smb_xport *rmi_smb)
 {
-	int retval;
+	struct i2c_client *client = rmi_smb->client;
+	int smbus_version;
+
+	/*
+	 * psmouse driver resets the controller, we only need to wait
+	 * to give the firmware chance to fully reinitialize.
+	 */
+	if (rmi_smb->xport.pdata.reset_delay_ms)
+		msleep(rmi_smb->xport.pdata.reset_delay_ms);
 
 	/* we need to get the smbus version to activate the touchpad */
-	retval = rmi_smb_get_version(rmi_smb);
-	if (retval < 0)
-		return retval;
+	smbus_version = rmi_smb_get_version(rmi_smb);
+	if (smbus_version < 0)
+		return smbus_version;
+
+	rmi_dbg(RMI_DEBUG_XPORT, &client->dev, "Smbus version is %d",
+		smbus_version);
+
+	if (smbus_version != 2 && smbus_version != 3) {
+		dev_err(&client->dev, "Unrecognized SMB version %d\n",
+				smbus_version);
+		return -ENODEV;
+	}
 
 	return 0;
 }
@@ -253,11 +270,10 @@ static int rmi_smb_reset(struct rmi_transport_dev *xport, u16 reset_addr)
 	rmi_smb_clear_state(rmi_smb);
 
 	/*
-	 * we do not call the actual reset command, it has to be handled in
-	 * PS/2 or there will be races between PS/2 and SMBus.
-	 * PS/2 should ensure that a psmouse_reset is called before
-	 * intializing the device and after it has been removed to be in a known
-	 * state.
+	 * We do not call the actual reset command, it has to be handled in
+	 * PS/2 or there will be races between PS/2 and SMBus. PS/2 should
+	 * ensure that a psmouse_reset is called before initializing the
+	 * device and after it has been removed to be in a known state.
 	 */
 	return rmi_smb_enable_smbus_mode(rmi_smb);
 }
@@ -272,7 +288,6 @@ static int rmi_smb_probe(struct i2c_client *client)
 {
 	struct rmi_device_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct rmi_smb_xport *rmi_smb;
-	int smbus_version;
 	int error;
 
 	if (!pdata) {
@@ -311,18 +326,9 @@ static int rmi_smb_probe(struct i2c_client *client)
 	rmi_smb->xport.proto_name = "smb";
 	rmi_smb->xport.ops = &rmi_smb_ops;
 
-	smbus_version = rmi_smb_get_version(rmi_smb);
-	if (smbus_version < 0)
-		return smbus_version;
-
-	rmi_dbg(RMI_DEBUG_XPORT, &client->dev, "Smbus version is %d",
-		smbus_version);
-
-	if (smbus_version != 2 && smbus_version != 3) {
-		dev_err(&client->dev, "Unrecognized SMB version %d\n",
-				smbus_version);
-		return -ENODEV;
-	}
+	error = rmi_smb_enable_smbus_mode(rmi_smb);
+	if (error)
+		return error;
 
 	i2c_set_clientdata(client, rmi_smb);
 

-- 
Dmitry
