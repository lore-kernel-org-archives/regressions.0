Received: from out-119.mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC970629
	for <regressions@lists.linux.dev>; Mon, 31 Jul 2023 02:23:00 +0000 (UTC)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bcheng.me; s=key1;
	t=1690770178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=vPdtbQm8V9rffwx3H/n5X0xB5XkYDYWRBPxYwhIjFQg=;
	b=Ga2lLIX8txBBTAhb6Vh9WsLKy8gRdcayGbTIR1oOmEkMjeg9cN0aiR9rYHBzMeBkH0WQBQ
	thUlBvoInIT3yF5fHdiKvBSF/119c5VscmewD77XgXOQto9ou7VAsPx+Q+Cc8l03a0ivc+
	z9kywYIjqmSjfwPBcL+l4R3+EV7hTsb9LAcEC9ofq04MSSGIj6OeCCvf7J7aA3CrcGbiST
	/X2WZ5M/0t4HBjqH4e0WU/o9POJWTpBDqJpjIgYrwrA2QjjFiGVXCoQnCnE80L3te0zsDh
	tfXhITxicxpahrtVYqMrp8OiEHqgCpqhxBephjSPZfE7/pn1ShoXWMkBq49CvA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 30 Jul 2023 22:22:55 -0400
Subject: Re: [PATCH v2] ACPI: resource: Add a quirk for Lenovo Yoga 7 14ARB7
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Benjamin Cheng" <ben@bcheng.me>
To: <mario.limonciello@amd.com>
Cc: <git@augustwikerfors.se>, <linux-acpi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rafael@kernel.org>,
 <regressions@lists.linux.dev>
Message-Id: <CUFZQ0PV3664.3HDBJ1V15F1E8@gold>
In-Reply-To: <20230728191408.18141-1-mario.limonciello@amd.com>
X-Migadu-Flow: FLOW_OUT

Would it be possible to include a similar quirk for the Lenovo ThinkBook
13s G4 ARB?

a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
doesn't break the keyboard on this model, but makes it very sluggish and
unresponsive.

Adding the following entry fixes the issue for me:
static const struct dmi_system_id lenovo_laptop[] =3D {
	{
		.ident =3D "Lenovo Yoga 7 14ARB7",
		.matches =3D {
			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
		},
	},
			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
		},
	},
+	{
+		.ident =3D "Lenovo ThinkBook 13s G4 ARB",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21AS"),
+		},
+	},
	{ }
};
