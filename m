Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E7917F
	for <regressions@lists.linux.dev>; Mon,  9 Aug 2021 13:32:40 +0000 (UTC)
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
	by mail.holtmann.org (Postfix) with ESMTPSA id 6C332CED47;
	Mon,  9 Aug 2021 15:26:18 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: regression: Bluetooth interface broken on systems with Mediatek
 CPU
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <a9cd03da-b816-eed3-7e77-d539924cbe88@roeck-us.net>
Date: Mon, 9 Aug 2021 15:26:18 +0200
Cc: regressions@lists.linux.dev,
 stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7621B196-B25E-475C-8D6E-AE6CFDFF8183@holtmann.org>
References: <a9cd03da-b816-eed3-7e77-d539924cbe88@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3654.100.0.2.22)

Hi Guenter,

> [ Greg asked me to submit a report to regressions@, so here it is. ]
>=20
> The following error was observed on Chromebooks with MT8183 CPU
> (ASUS Chromebook Detachable CM3, HP Chromebook 11a, and others):
>=20
> [  224.735198] Bluetooth: qca_setup() hci0: setting up ROME/QCA6390
> [  225.205024] Bluetooth: qca_read_soc_version() hci0: QCA Product ID  =
 :0x00000008
> [  225.205040] Bluetooth: qca_read_soc_version() hci0: QCA SOC Version =
 :0x00000044
> [  225.205045] Bluetooth: qca_read_soc_version() hci0: QCA ROM Version =
 :0x00000302
> [  225.205049] Bluetooth: qca_read_soc_version() hci0: QCA Patch =
Version:0x000003e8
> [  225.205055] Bluetooth: qca_uart_setup() hci0: QCA controller =
version 0x00440302
> [  225.205061] Bluetooth: qca_download_firmware() hci0: QCA =
Downloading qca/rampatch_00440302.bin
> [  227.252653] Bluetooth: hci_cmd_timeout() hci0: command 0xfc00 tx =
timeout
> ...
> [  223.604971] Bluetooth: qca_recv() hci0: Frame reassembly failed =
(-84)
> [  223.605027] Bluetooth: qca_recv() hci0: Frame reassembly failed =
(-84)
> (repeated several times)
> ...
>=20
> The Bluetooth interface on those Chromebooks can not be enabled.
>=20
> Bisect suggests that upstream commit 0ea9fd001a14 ("Bluetooth: =
Shutdown
> controller after workqueues are flushed or cancelled") introduced the =
problem.
> Reverting it fixes the problem.
>=20
> The problem was also reported at [1] on a Mediatek Pumpkin board.
>=20
> As of this writing, the problem is still present in the upstream =
kernel
> as well as in all stable releases which include commit 0ea9fd001a14.

post it to the linux-bluetooth@vger mailing list. This is Qualcomm =
driver
specific and maybe they broke something. However there is an ongoing
discussion about your bi-sected commit regarding Mediatek Bluetooth =
device
where this seems to also have caused a problem.

Regards

Marcel

