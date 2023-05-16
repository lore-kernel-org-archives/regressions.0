Received: from tilde.cafe (tilde.cafe [51.222.161.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D33F4FD
	for <regressions@lists.linux.dev>; Tue, 16 May 2023 10:26:34 +0000 (UTC)
Received: from [127.0.0.1] (106.208.19.217.sta.idknet.com [217.19.208.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by tilde.cafe (Postfix) with ESMTPSA id 7588B2027D;
	Tue, 16 May 2023 06:26:26 -0400 (EDT)
Date: Tue, 16 May 2023 13:26:23 +0300
From: Acid Bong <acidbong@tilde.cafe>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BREGRESSION=5D_Asus_X541UAK_hangs_o?= =?US-ASCII?Q?n_suspend_and_poweroff_=28v6=2E1=2E6_onward=29?=
In-Reply-To: <ZGKbRo9shUcR0myC@bhelgaas>
References: <ZGKbRo9shUcR0myC@bhelgaas>
Message-ID: <A5B9D233-A082-4C60-9DCB-2B0A2081C089@tilde.cafe>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

>Can you collect the complete dmesg log and output of "sudo lspci -vv"
>and post them somewhere (https://bugzilla=2Ekernel=2Eorg is a good place)=
?
`lspci -vvnn` output is linked in the head of the thread=2E Append =2Etxt =
to make it readable in the browser (I only understood it after the upload)=
=2E

>Ideally the dmesg would be from the most recent kernel you have=2E
Speaking of that, a couple of questions:

1) Should I post them with or without pci=3Dnomsi/noaer? The problem with =
disabling it is that it floods the logs so fast, that they reach 700M in 5-=
7 minutes, and, when rotation is enabled (my parameters are default, up to =
10 copies 10M each), all pre-flood data is lost instantly=2E

Also I'm currently bisecting the kernel with MSI disabled in the config=2E=
 But I'm keeping the parameter in the bootloader for cases when I'm using G=
entoo's prebuilt kernel=2E

2) Can I delete messages by ufw? They contain MACs of my router, laptop an=
d cellphone and I don't really wanna share them

3) I'm not savvy in logs, how exactly should I share dmesg? `dmesg > file`=
? /var/log/syslog? I already know kern=2Elog doesn't contain logind and som=
e other messages that are present in dmesg

4) Should we continue in this thread or rather start a new one?
