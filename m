Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70EC45A28E
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786704142; cv=none; b=rZNFfi0P1tPJH+x6iXxp4v3TyhI7iycEQI1gH2hTZulsRbLEN4YDtZyz+ZC2wAkzSE++saCUdb7aE96r/f9ZZE4ln47V4+kPpKxLtlxAxI2lSxfx8KHnk8410f0YcQ/7GlLXiTiy7Ot6ti7cUHg+Djstfl3fmdj7ub7hCIlWM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786704142; c=relaxed/simple;
	bh=D1i/2aqclwsKMHn3WjfuRKa1kTpN0YZ5JtI5a0o0cC4=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=l8El8cIbzFnQLL5iSG5pDywKmuaiJkPfpBStp/8cKi/Q2w4buTQYs/JT14Ly4UQ3WouI8TVAzC2ajHUPpvTl89YrH2SskJQURs2QPHzM/2KKPh7jNp8p3HnaSfHIqwwjs+wFyAxRwjYBwKZY1NhhMyaz09ec7XMwha8nbqRd5es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=rUgPuajn; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="rUgPuajn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786704115; x=1787308915; i=adventurefan@gmx.de;
	bh=D1i/2aqclwsKMHn3WjfuRKa1kTpN0YZ5JtI5a0o0cC4=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:To:
	 Cc:From:Subject:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=rUgPuajnMAqx6qlIKX8MX8KjGIvCaMX95KpkB2XCGbtYU2W+lTBkXr25HqWMisQe
	 zagdw2mRxzOW+2MFE754gKjoXgYph05XbpFXrm7TWPt1HIrcOlyXrO9zNZkKyPLPz
	 IbPaUuhd5CNM/qV/1ntfgiDjgjV67VuoeSVRFFKV3p3m2vbYwcA+G7eUKGWc5uCAT
	 znPQ4OPJO+1oqpcWfQg7JpPK3wGfxO+8yp2EBnMI0MCE8g7HgU20L8SGS21ZtNyv5
	 oqtQ1T+ikPU/zyi1MFdM3JhSr73BSIObJ/+odolcfPqu/qlORaohyN/BmvSMjMYwL
	 cQFvkG86QZn2dWVUpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9MpS-1wxsAR1CS4-012nvk; Fri, 14
 Aug 2026 12:41:55 +0200
Content-Type: multipart/mixed; boundary="------------wCYnsaE2iPqU27ou368xUume"
Message-ID: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
Date: Fri, 14 Aug 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, tiwai@suse.de, perex@perex.cz, i@rong.moe
From: "Alexander N." <adventureFAN@gmx.de>
Subject: [REGRESSION] ALSA: usb-audio: Logitech PRO X Wireless 046d:0aba
 playback volume rejected as sticky
X-Provags-ID: V03:K1:ZnPGeTvViwPr6I1jKu/wRH081AeaWfdPCN4+lReSoaGJE6Eu+aw
 EhzJRHycGG+enmyjKFRpabZo+us22SDo3vXF1/XDvADkOzjAHn71YTc+gNnNJsnfMDdXTDm
 F4qpmYp5i/yRQIQ3IB4pxIt6hLlmLukqPSoQGrwwihJSIMEl+R0/kVTpH95lvEG+eODswpa
 H/dPPBav+ICRlq8erhTYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JZ1XDTH/hZo=;c3ULb9OgDRKnS4v9a5AcFuGvXz5
 pmpbHHH8O3EDQkZglqI+7PMlUgG1cK6AnVmaFcsH2u/RM2dcbebOVLxpmp6lm9d+gvbYCSEgR
 NtESCE3snR6wQjk+73InGjaLMY3665rhsEhSd+4WAZPgtzvAyJzEKGq5SELdiwjo4PSS6XhQG
 VeQvcLFgdYEnJmyRSZjuEccn2pRSSnONXa6K/wRBXR0xvkBwRrz39CYNixNB0ReOVYIgcPLs7
 etNcAGf89RkK8emGFW1UHthOHf2QNTXE8FBIoI2t8zmkhsYQdysJJq/25IyMXzW+yC3PHhvDf
 4T0JE5iPEFz8BMAzzZly8hF6gex4FM3/XrkpDqsaQaDpV0qqoFzI8HKEUU4YtCq2RK51P+q0t
 XMOBvaRuu6oLE3gkPc7EAa8coqQ7GG5W4A0bPSjsMP2TN18kuYecwodYojbxfDIeSWRbDw9Wt
 nZlllV+/NJlvEoNgpN2hsbS9Eq7tW8OFrajStJjkjxUIdXeRBHnbqzePs4G536yWfO3bHzx97
 prycXIxhfVBYqI/s/lmuwuGf2fDSMrrFsrU6OUwRoGLi+KbxZwiVAIzHu9ua8GHHtgDDXkvb9
 f1Ff9Wfh1L79c/9fNxXUnGjLiJ+mhgPRG+lmmxhb4JMylI9PoDpWVcx7j6tU3uQNBno10xQcq
 +NCpAs3GOl0H2GEQ1mPWaJ4GAOz+ET8zPxJgzCxuzsKsqQaDsBL9jObWKbCy44UOSUJ21YFxZ
 eQ6ePGjTStnfAecyOG0/rNUSjBpOroZ2+8dnZYHA1ez3XnkyuzOGIDW4KqIk+xoCdc6O0StAN
 /WyG2QPL0Hw/kfMn4OGSke5BLbqHsbaoXQ7k+Kmrlf4xOY7eTbdV6RaVKsSsIVSAz/pgDqIU+
 8KbOJpW9JyxyXK7gPYNkvGzQ8prQ7KMz3J1iLz7Ct6jVKduLAx/YjL6F72ULfPbUNGaslRloB
 RTF/xJknmrnFEpUVE/Y14r52Pt80GZgqPtnTsQBkeHLKcONFSUsgm3pEAJjYHM/G+0E5M1g7d
 JzFYJ6ueVPA70HGmkgZhI+fEXwN0SzCG4T7tE5hW1P57Nv8V7J2M6dwxoX/gb3OmlCEZF50Ll
 7ElQV7hEgoQnuC3aGgd13w4ra5JYSHjn5J8jkbs7CxUBz+2lYloN2rQqocZG6LBYOOlGtfV9Y
 LleWbK8MJo5MUwDuSg0iQYht+aFEYTVyzp73lR4U9qZkNTSXlFbQPZ4GqEBQPAJSUQThy5heK
 5B9WoXV4nCcvlVlpLJdwdlHhjUUbtum4hYb489f1ykwKG34rp7L/G7BqlPC1dCvnhhg0xDO9N
 V/glpUA9f2wT9twxQQJfHbxZszKRnE1+7v3XQ5Og++VpWyGGsPk4MjtWGNMihqrCCHq12OoB8
 nSl8FM5VLHe+VkPYhhnZMW/cq2kcqBPzW19KgH1dlR5zQYdxqFrhxErFpde0bDYttyoAzcwcD
 DgqUnFtIf4WCUWOiSuACZclaK3BK3rzZxaXqU1JRhQwsD7bsskXLUgRHs1oR0TVb2elB6/cZV
 LYY9bP1Haxr/QURz7wZDXKqeRK9K4Cl3VTWmMd4M7eLb+DiigPC8Ynt6KZMwA60TKdG5HjLf9
 Rr65ugdlllw9meAtLQ9qALXcNGEA/8cNvIzM9FwdDVo7fu0m3DlldHlBCz3GwpBoD7s9diUCP
 rVclJBc0hEwsLqQBn6t6qsQg0A0OsCByyxLlblatm76jmTzf3tbYmKGhHhSSjLyNxo4kOyyxk
 NzXxyRdd80D9ZqMY17czo4d2DXkyMN4uI0N2Bhxg4D9yLLC4JheadIpsSJasDGAmwIZ7juewt
 JB+mPCDw6azhUUrR+TZ3nsxepdFWUHNvCkKSwRC+82D6W32T3TxRfxOCjbwACLiIZtlKDE/Jn
 OvMoJ/k6rs4oSvUSRtzDSfhEqiUpAn2JaoHYe0gVDMpgHdDqgfOMAZQQqVhlxyC2fnJ86Fg1d
 Ej6FL6cmETXzYQWtjXz1M3zhRWBb5k3CyDMX1SP3ET5ucwxykjRqXOQdTLcDWGgbO/r3pHDGo
 ToRsMBaj90JSPmzhTCPJ5/ygRvvwj0As9HfIK6nSwHmXfa2ho8QcRS33BGoohK22lxRmRl2rI
 wSm0b+q69zyBX1m8+qstgejNi2emuNBczfZCXlSUY6WcJibbBEad6CsFJM5KevixR+uq5mAY/
 2UrJc/xFHkdqHneTIw81Fo5njtSCTx6BuOfsBmqW95DAUVgJ38F6zfBXOYtOMyZGpIom87xdi
 mBX41uFKHeLahL5Nzkw7usSR6cE5aaaxI5hrRW9v5t+xLHqFZww8B+OE9IypPBWZJLVEYT3LJ
 G9pmorW1d7SIcdBTPWkDzD8HP5Ifvg2JvZCU8O0oGSTgZFtXvzalMZlr01aTWlmXQpNFo7mmF
 E7l7tcaX+zuxFVrN1mglsLNziR43BXZRwHHoz8ENAsx6F5i1fRh4CZpb2ZhuebcdsSrQt20/y
 +QzrARY0WKsGKeJIzkQ3KBCsms3VVxsTRA9u79eX3i16w/r5XsIMKfExYdYdlefd8f8cVAFNl
 QeaQ6gAVwCcv0Pl16mE8Lv6WTW3kQ1Nl10Kj/Hz/O1nSTcNj+q1wd2rhqh+bntUym6s3EGKG1
 Nm6lFFkqY/jMyopdTVLPH+f8McfsqJSeth4zi9Fk7zOHVzkmqepF7zVU+74p1cKIHSA8H6N5e
 SiCDI6UQg+jhKy+jSpFfrMrFl6K2P9KuGZRSlZWMCvnNOaW+RdDeMU2OHoeeyPCt0FmFQEkS5
 X0uAbu0gODJtZd0cpzCyhePWdM3ZGFWTPbFoKNs5GeOzwmQJoyd8ujKcOUZdGqRbW1rr4HZ+V
 YHFwbgkwZgfPmQeQ3fXkgGP2zphTiY3oLH3BwZZdVpnRwWlwUB/FwDqJzQppaLSs565favy62
 e/O0fzhCcX/7jSs10BFurbVAvKImDtHLxindvzWCHYwTdu8N8fDWMzuIgWNDVY6eDiY9pU+ra
 HohmpzqCKh4CiEpeZNA5AqRWEsa56GAP8BdaKrcDNmGm7DUgDLAMol7cl212/bonGZ8ePX8v/
 j9yCct/1+BLdw4tamsOMWFz7/r0LTcAwCrNQQVZTbs7w18GOfk8bpNOTH0RmPsPOsrbYKi1yX
 nlb+YczagR81zTWD9PHgory3Qfvmf9/l3gAfPHV/8n+nkFrpQXEw201pmn6YuwFKD9Tr+c9Ew
 Lie+7+KRPbVVcx2y+JBK3zBqT7v8dTG0nNEUihN1kvinQW8Njg+MeBRyufkYYti4HGrRpjbD2
 GeFFaG2ABempKURJuVnR18eYCNgSVpdPVrL9wSYwIhWpR+wcFI9Mtk2ZgudsJ2i5/ZlNT6zZk
 VlYS+KFIz1CeUbM2/TbHXo28t1+avUtX9QVAcpnm/mRyiE2WW3wt5OVnoErIY+Orkkk74/kpQ
 6n6frZ+vIZbxg+xBKcpOvufAx87HEg1kn0mLjun8hBowVkB0ybUkHgW6a8or0GgeNUrp9sSxB
 SgOKaoCASgMrRkE66oVZZQy6b7kpX26qDKblAlEY0h/4aC1i6PnMjba8MxqK37J/ve68Dxha9
 ozssCz0HZWnuEKERT60EXTBvx35X8Qe3UbFviJDk9l9jim+ttmlFOjX3QjmTZ5Dk4bgeG5E1Z
 lkYaW5zS4sqDkXZc2fvnW3gueXHRRmuNjBbeVCyf/WfV9xNq2/LJIzsTE4Zje8FsB55mkOXEa
 mUfoEC1CG5ern/lmqhE616xiGSiMyK07WS577Vq+4uyImPWcTzc2W2OgZwUQ/5WHDYOOlScYn
 TNC3IALPr8GwQLFkZ3F98FYthK36Scj/iWYtDJ/pWWTtTvuUlvmlLd7BQ4sR2pIvL5tBtSSLe
 QOhZLN7Rm3y7glGKhRM9MTc9PDjcCMSFgUzo5g2GiqTj/NykoaoVmr24uKGhYF36fPT5StFpL
 vlXv8bnXyDqdEXtBrY73OQyKQqRBQZ9wUgouqIMq+C0vc06jSj6g/EUv0QllTZNm9KiMqQVL9
 7PfAK6AXNJtnQnfTFrO8yuaYt4TUTPI75y/pdNFY+dIXvrSv1Y2ESjuGuML2dLTGIOxC7nCJX
 p2YySeAAOcBJUKG2E6ee3fW7XK8SbwA/8/HZDre8Kzg7zVmeY/gWO8G5yTNbpH8gRg4FjrpQi
 KPaUWYIwPOBwA6A4kN6x1CId0vdoiYSSFr+R0/9IHPDMqVOgZ6jypNVqQ/uahaAl8O+wokly5
 HbQI6j3Svh3PACFCg0M+5E6Uy5GYMewQUORK6I6aH588xhf5aikyIpHGhWSYshBRuUNDIJD5b
 G8piwTyGJI5d06pj97xsDPK9HqO6TOxU39dRw2uegyCKpS2HSVE/PlC5rrw2iUgcJX10zMdiR
 50QfGyD2J6iO5DjXK3nfO39HECYFMenAUFNYJjsWCLrnBLw2lsDus4lczKHel+0kQaTlEOu9W
 DntrDUceGlBZChVtMZTCDVC8ac1T/o9ldlm7+hiYGRLRezbCw8ysEVZEVBJqHnYO8bjSpdZGT
 cSz+/9i449aSVLiYbp4wAA59A+VrxQDFnfmTDPDqbs+zOMR/KCEOHrN/pkhIdJa7ve30dv7ex
 94P2o8exdwKTmmJ6eO4XaHF1ADrENqlcV/1u8nEDgsxDH4Wt4aduyZjsqiUghsJ8ZUcgiJvHY
 KRRfkpAdfNGNMQb6MALDemZTIztLAQuQ0BENucvdLKdVvxjHxrquhCQTei5s4BZnsszTFoM/n
 /FuIdxxpS/ZsABM4Cu+70VsGQen7nMfzL25ckTHXVIzfkAMuGbdxGFMKOhgY4qCl2l0aTJF3Z
 xaWP940DObkd6SJzZ8jeoTA8h7YmOKM8+9AyHEO14fg+SjIks6mhcZO3YmPHZd6/Tk2BigzPO
 LhHNqI8aHijySYYIl6eeif+sPrRAG8mybEqqCYB4oALzFgk022aFmTqA7LCmexeUFPEETisz4
 0AQg0rM8LopucbO6iKhOSCAbwe/FHk47vF/TmxRR8I3MhJoudcPggNCidCcCembVILt0qiBms
 ePetkpj+a6tdzFLd3EyM3+iJqYvocd6hHR/oveDfvuRhGW+gNWSI/X3Hed79dgVmFgBT8RXuU
 C92Hp/DuQhpQzotNTy0tq6WJFPAfYh2nAFnh4XCV7OMbdp/iXLzVCCzOmAyVGQWTpo8nwonp4
 iJyImc1iy10jXEQwgjH2yTQRVlASqZBkTEbnZ7xWumPUxITDsU5+VFg/qEi+4bMsYhHnYtUvE
 PYimRJGu6kaohRg51ZHbx88HX9swblU5NiCSUZLg1Y4CiUbvwW52en5eOvjzDYDpPZ/jsgHf5
 dT7Zh00pdWgIsOnYcKxRj4fRH79s5GuVpfBsc8Fn6uivFK+sUJGcI+8sFJiaAAx+vvQY/4AjX
 kVQxtNZHdl3DpvzY2S0laeaZgQPvjMNAKUqbQjJusUgLyzAvYYHr0dROSvF37MKgauYK2RFy0
 EIwOD1PP0yU94dwyxTDrTCtCyoYZKHZUezuNog3kddGVDQt7k0KNuNR5hrD63K5e7taccJiBf
 juP8/qixALUlKLGOwQfmReq/F9Rfo6ncwukJ3MkzT8MUs0gPOzwwSH01ouarkQb7U+DUZQoj3
 /EfWDWmHQRSj/4ADHaZERjxS0oz7GVcvMN2VK8Qg6/SjJqL/LR4/zmZXfvU3zqOAPqfeTJyCQ
 GR/kzbTd5d65SuESl/sm+IhpElbKT7aVDa3G7XqFyrTUR8dlDMtH6WCyzLyEodnCIK7Y6Psn5
 W5yqOa084AwjiGgQjy6U9WKhq8yNKtexFqIWI/8dQTPiPNkwN7GPp00nVfu23c5H25qak4q3i
 f/orMFXmHopmkcMcoI4uG1Ulm0L3akVCHZeVcBorBbL6ghf7oEE+wRsADYwfSb2+hcg4hJ1IO
 w43w001AXCDpcorz6+KbdBm6LC4ZiGx5oA/Di/aHd3GKOd5aLQBsI5rmOQqocE4ItPHHjyHWj
 VOxEe3X5HI4D6LAIDz6HbGJq9xk1ggfa9nxv3QMc/m4UcIPjLT0ECkkimN0xCvNXOWlJiKAuh
 cpClPUr/1ASTGH5NMXgGtK4nbUT3I4eFIMgl+dWrbZ+WX2VgwNAwpeMvO7p/ivdLE0/3TqGG+
 FeYm/rXLGdQ+b/1RYQjh5omxeY8PgOeF8og1m9dQfdBvZ53qx28/m3YF/q/IfeEexat/3S9sX
 jitsvMLTh8WZaVSQPLSvlNbNVO59X+0wCtSatcBBpC/HiRpM7kWp4PRhH/8A1a0QbjLdRE5Pn
 YF4Q/T2p0UZYGD9wopYPFgYuhfjU3H4++D90nhvs7O61wUyy9rycmkpcM/TUNaW3Fngx0DFfX
 is6wTC63CVJrluar3iY6cIdJW86pOaNV30sTYNe4JFfdg1nGQE1IfRrkDrXjqbwA4=

This is a multi-part message in MIME format.
--------------wCYnsaE2iPqU27ou368xUume
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

I found a regression in snd-usb-audio affecting the Logitech PRO X
Wireless Gaming Headset (USB ID 046d:0aba).

The device has a valid UAC1 playback volume control, but the sticky mixer
detection introduced by commit 86aa1ea1f15c ("ALSA: usb-audio: Do not
expose sticky mixers") rejects it.

Hardware
=3D=3D=3D=3D=3D=3D=3D=3D

 =C2=A0 Logitech PRO X Wireless Gaming Headset
 =C2=A0 USB ID: 046d:0aba

Observed kernel
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 =C2=A0 7.1.5-ogc5.1.fc44.x86_64
 =C2=A0 Bazzite/Fedora 44 OGC kernel

The OGC patch for this kernel does not modify sound/usb, and the relevant
mixer.c code matches upstream Linux 7.1.5.

I have not hardware-tested current mainline 7.2-rc7, but current upstream
mixer.c still contains the same immediate SET_CUR -> GET_CUR sticky mixer
test and I could not find a device quirk for 046d:0aba.

Symptom
=3D=3D=3D=3D=3D=3D=3D

Without a workaround, ALSA only exposes:

 =C2=A0 Simple mixer control 'PCM',0
 =C2=A0 =C2=A0 Capabilities: pswitch pswitch-joined

There is no PCM Playback Volume control.

The kernel logs:

 =C2=A0 usb 1-10: 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disa=
bling

I have also observed the same message ending in "=3D> 0", depending on the
hardware volume at probe time.

Because the playback volume control is removed, the physical volume wheel
changes the headset's hardware volume independently of the PipeWire/KDE
system volume.

USB Audio control behavior
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

The device is UAC1.

Feature Unit 2 exposes a master playback volume control.

Direct control requests, after temporarily unbinding AudioControl
interface 0 from snd-usb-audio, report:

 =C2=A0 GET_MIN =3D -16384=C2=A0 (-64.00 dB)
 =C2=A0 GET_MAX =3D=C2=A0 =C2=A0 =C2=A0 0=C2=A0 (=C2=A0 0.00 dB)
 =C2=A0 GET_RES =3D=C2=A0 =C2=A0 256=C2=A0 (=C2=A0 1.00 dB)

GET_CUR and SET_CUR both work, but the device has two quirks relevant to
the new sticky detection.

1. GET_CUR reflects normal SET_CUR changes with a delay of roughly 50 ms.

Measured from 0 dB:

 =C2=A0 target=C2=A0 =C2=A0 =C2=A0result=C2=A0 =C2=A0first visible GET_CUR=
 change

 =C2=A0 =C2=A0-1 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A081.3 m=
s
 =C2=A0 =C2=A0-2 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A051.9 m=
s
 =C2=A0 =C2=A0-4 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047.3 m=
s
 =C2=A0 =C2=A0-8 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047.1 m=
s
 =C2=A0 -16 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A051.7 ms
 =C2=A0 -32 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047.2 ms

2. The advertised minimum value -64 dB is not functional.

A direct SET_CUR to -64 dB returns success, but GET_CUR remains at 0 dB
even after 1000 ms.

This appears to cause a false positive in check_sticky_volume_control():

- cval->min is -16384 (-64 dB)
- cval->max is 0
- if the saved value is 0, max is skipped
- SET_CUR(min) returns success
- an immediate GET_CUR still returns the saved value
- the mixer is classified as sticky and is not registered

mixer_get_cur_broken is not appropriate
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I tested the mixer_get_cur_broken quirk.

GET_CUR on this device is not broken or constant. It correctly reports
host SET_CUR changes after the device delay, and it also reports volume
changes caused by the physical headset wheel.

Using an internal-only cached value would therefore lose useful hardware
state.

Local proof-of-concept fix
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

I built a local snd-usb-audio.ko against the running 7.1.5 kernel.

For this specific device, Feature Unit 2, UAC_FU_VOLUME, I:

- clamp the unusable minimum from -64 dB to -63 dB
- skip the probe-time sticky/resolution checks for this control

With that module, ALSA exposes:

 =C2=A0 Simple mixer control 'PCM',0
 =C2=A0 =C2=A0 Capabilities: pvolume pvolume-joined pswitch pswitch-joined
 =C2=A0 =C2=A0 Playback channels: Mono
 =C2=A0 =C2=A0 Limits: Playback 0 - 63

/proc/asound/card*/usbmixer shows:

 =C2=A0 Unit: 2
 =C2=A0 =C2=A0 Control: name=3D"PCM Playback Volume", index=3D0
 =C2=A0 =C2=A0 Info: id=3D2, control=3D2, cmask=3D0x0, channels=3D1, type=
=3D"S16"
 =C2=A0 =C2=A0 Volume: min=3D-16128, max=3D0, dBmin=3D-6300, dBmax=3D0

Most importantly, no userspace workaround is required once the mixer
control is restored.

Example before rotating the physical headset wheel:

 =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A0-27 dB / 57%
 =C2=A0 PipeWire: 0.35

After rotating the headset wheel:

 =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A0-11 dB / 83%
 =C2=A0 PipeWire: 0.65

KDE system volume follows the physical wheel as expected.

I attached the proof-of-concept diff and the measured results. I am happy
to test a maintainer-preferred implementation or additional diagnostics.

My suspicion is that this device exposes two assumptions in the sticky
mixer probe that are not universally safe:

1. GET_CUR is assumed to reflect SET_CUR immediately.
2. advertised min/max values are assumed to be usable test values.

Thanks.

#regzbot introduced: 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03

--------------wCYnsaE2iPqU27ou368xUume
Content-Type: text/plain; charset=UTF-8; name="measurements.txt"
Content-Disposition: attachment; filename="measurements.txt"
Content-Transfer-Encoding: base64

TG9naXRlY2ggUFJPIFggV2lyZWxlc3MgR2FtaW5nIEhlYWRzZXQKVVNCIElEOiAwNDZkOjBh
YmEKClVBQzEgcGxheWJhY2sgY29udHJvbAotLS0tLS0tLS0tLS0tLS0tLS0tLS0KRmVhdHVy
ZSBVbml0OiAyCkNvbnRyb2w6IFVBQ19GVV9WT0xVTUUKQ2hhbm5lbDogbWFzdGVyICgwKQoK
R0VUX01JTjogLTE2Mzg0ID0gLTY0LjAwIGRCCkdFVF9NQVg6ICAgICAgMCA9ICAgMC4wMCBk
QgpHRVRfUkVTOiAgICAyNTYgPSAgIDEuMDAgZEIKClNFVF9DVVIgLyBHRVRfQ1VSIHRpbWlu
ZwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU3RhcnQ6IDAgZEIKClRhcmdldCAgIFJlc3Vs
dCAgIEZpcnN0IHZpc2libGUgR0VUX0NVUiBjaGFuZ2UKIC0xIGRCICAgT0sgICAgICAgODEu
MyBtcwogLTIgZEIgICBPSyAgICAgICA1MS45IG1zCiAtNCBkQiAgIE9LICAgICAgIDQ3LjMg
bXMKIC04IGRCICAgT0sgICAgICAgNDcuMSBtcwotMTYgZEIgICBPSyAgICAgICA1MS43IG1z
Ci0zMiBkQiAgIE9LICAgICAgIDQ3LjIgbXMKLTY0IGRCICAgRkFJTCAgICAgR0VUX0NVUiBz
dGF5ZWQgYXQgMCBkQiBhZnRlciAxMDAwIG1zCgpPYnNlcnZlZCBzdG9jayBrZXJuZWwgbWVz
c2FnZQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQp1c2IgMS0xMDogMjowOiBzdGlj
a3kgbWl4ZXIgdmFsdWVzICgtMTYzODQvMC8yNTYgPT4gLTM4NDApLCBkaXNhYmxpbmcKCkFs
c28gb2JzZXJ2ZWQgZGVwZW5kaW5nIG9uIGN1cnJlbnQgaGFyZHdhcmUgdm9sdW1lOgp1c2Ig
MS0xMDogMjowOiBzdGlja3kgbWl4ZXIgdmFsdWVzICgtMTYzODQvMC8yNTYgPT4gMCksIGRp
c2FibGluZwoKU3RvY2sgQUxTQSBtaXhlcgotLS0tLS0tLS0tLS0tLS0tClNpbXBsZSBtaXhl
ciBjb250cm9sICdQQ00nLDAKICBDYXBhYmlsaXRpZXM6IHBzd2l0Y2ggcHN3aXRjaC1qb2lu
ZWQKICBQbGF5YmFjayBjaGFubmVsczogTW9ubwogIE1vbm86IFBsYXliYWNrIFtvbl0KClBh
dGNoZWQgQUxTQSBtaXhlcgotLS0tLS0tLS0tLS0tLS0tLS0KU2ltcGxlIG1peGVyIGNvbnRy
b2wgJ1BDTScsMAogIENhcGFiaWxpdGllczogcHZvbHVtZSBwdm9sdW1lLWpvaW5lZCBwc3dp
dGNoIHBzd2l0Y2gtam9pbmVkCiAgUGxheWJhY2sgY2hhbm5lbHM6IE1vbm8KICBMaW1pdHM6
IFBsYXliYWNrIDAgLSA2MwoKL3Byb2MvYXNvdW5kL2NhcmQqL3VzYm1peGVyOgpVbml0OiAy
CiAgQ29udHJvbDogbmFtZT0iUENNIFBsYXliYWNrIFZvbHVtZSIsIGluZGV4PTAKICBJbmZv
OiBpZD0yLCBjb250cm9sPTIsIGNtYXNrPTB4MCwgY2hhbm5lbHM9MSwgdHlwZT0iUzE2Igog
IFZvbHVtZTogbWluPS0xNjEyOCwgbWF4PTAsIGRCbWluPS02MzAwLCBkQm1heD0wCgpQaHlz
aWNhbCB2b2x1bWUgd2hlZWwgaW50ZWdyYXRpb24gYWZ0ZXIgUG9DIGZpeAotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpCZWZvcmU6CiAgQUxTQTog
ICAgIC0yNyBkQiAvIDU3JQogIFBpcGVXaXJlOiAwLjM1CgpBZnRlciB3aGVlbCByb3RhdGlv
bjoKICBBTFNBOiAgICAgLTExIGRCIC8gODMlCiAgUGlwZVdpcmU6IDAuNjUKCktERSBmb2xs
b3dzIHRoZSBoZWFkc2V0IHdoZWVsIGFmdGVyIHRoZSBjb250cm9sIGlzIHJlc3RvcmVkLgo=

--------------wCYnsaE2iPqU27ou368xUume
Content-Type: text/x-patch; charset=UTF-8; name="poc-fix.diff"
Content-Disposition: attachment; filename="poc-fix.diff"
Content-Transfer-Encoding: base64

UHJvb2Ytb2YtY29uY2VwdCBvbmx5OyBub3QgcHJvcG9zZWQgYXMgdGhlIGZpbmFsIHVwc3Ry
ZWFtIGltcGxlbWVudGF0aW9uLgoKLS0tIGEvc291bmQvdXNiL21peGVyLmMKKysrIGIvc291
bmQvdXNiL21peGVyLmMKQEAgLTEsMyArMSwzIEBACkBACiAJCWlmIChjdmFsLT5yZXMgPT0g
MCkKIAkJCWN2YWwtPnJlcyA9IDE7CgorCQkvKgorCQkgKiBMb2dpdGVjaCBQUk8gWCBXaXJl
bGVzcyB2b2x1bWUgcXVpcmsgKDA0NmQ6MGFiYSkKKwkJICoKKwkJICogVGhlIGRldmljZSBh
ZHZlcnRpc2VzIC02NCBkQiBhcyBtaW5pbXVtIHBsYXliYWNrIHZvbHVtZSwgYnV0CisJCSAq
IFNFVF9DVVIoLTY0IGRCKSBpcyBpbmVmZmVjdGl2ZS4gV29ya2luZyB2YWx1ZXMgYXJlIHJl
ZmxlY3RlZCBieQorCQkgKiBHRVRfQ1VSIG9ubHkgYWZ0ZXIgcm91Z2hseSA1MCBtcywgc28g
dGhlIHByb2JlLXRpbWUgc3RpY2t5IGFuZAorCQkgKiByZXNvbHV0aW9uIHRlc3RzIGNhbiBt
aXMtZGV0ZWN0IHRoaXMgdmFsaWQgY29udHJvbC4KKwkJICovCisJCWlmIChjdmFsLT5oZWFk
Lm1peGVyLT5jaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MDQ2ZCwgMHgwYWJhKSAmJgorCQkg
ICAgY3ZhbC0+aGVhZC5pZCA9PSAyICYmCisJCSAgICBjdmFsLT5jb250cm9sID09IFVBQ19G
VV9WT0xVTUUpIHsKKwkJCXVzYl9hdWRpb19pbmZvKGN2YWwtPmhlYWQubWl4ZXItPmNoaXAs
CisJCQkJICAgICAgICJMb2dpdGVjaCBQUk8gWCBXaXJlbGVzczogYXBwbHlpbmcgcGxheWJh
Y2sgdm9sdW1lIHF1aXJrXG4iKTsKKwkJCWN2YWwtPm1pbiA9IC0xNjEyODsgLyogLTYzIGRC
ICovCisJCQlnb3RvIG5vX2NoZWNrczsKKwkJfQorCiAJCWlmIChjdmFsLT5taW4gPCBjdmFs
LT5tYXgpIHsKIAkJCWludCBzYXZlZDsK

--------------wCYnsaE2iPqU27ou368xUume--
