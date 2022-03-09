Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0E4C80
	for <regressions@lists.linux.dev>; Wed,  9 Mar 2022 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1646844384;
	bh=m/AdWRsMI2+av0qDE3RfTT/eQFODX3/PdaW6592wu9M=;
	h=X-UI-Sender-Class:Subject:From:Reply-To:To:Cc:Date:In-Reply-To:
	 References;
	b=bAB3MFz3rLBG/RCS/UOFqULdroi+fUtw9zUlfPJHq2fhN5ZW/7YRAwy2q6+WX3wMA
	 mjvgM2AnxMfenhNQq4/pbvMuv9yEo1NamVX3s8s7a6KTgrQShIm+IHCzmD2QXBxzWW
	 QE6+Fgfp4xjvtCEHHXEoQe2ZJnAD0aFNu/4LQQW0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from RMLAP1 ([185.183.107.226]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5if-1nktkQ0MWj-00J3Qo; Wed, 09
 Mar 2022 17:46:23 +0100
Message-ID: <4249d21e2638af07f43121982cf9dcb73b116ad9.camel@gmx.at>
Subject: Re: laptop does not go to suspend anymore with kernel version >
 5.16.10
From: Reinhold Mannsberger <reinhold.mannsberger@gmx.at>
Reply-To: reinhold.mannsberger@gmx.at
To: Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Date: Wed, 09 Mar 2022 17:46:21 +0100
In-Reply-To: <776197b3-cc56-3948-d6e9-68bed82d9730@leemhuis.info>
References: <4a83b8d3dc68a2bf6c7e988552a213f161b54c3a.camel@gmx.at>
	 <776197b3-cc56-3948-d6e9-68bed82d9730@leemhuis.info>
Content-Type: multipart/mixed; boundary="=-1QMXBRzTcc5BlvukF/OW"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Provags-ID: V03:K1:o7zl1qM0OEcc+BKQDXJfCaEEasjPPVOdsp0oO+8p7epiJNmjHV7
 XEETqMhv0vek5fKSjP/kSgbyxB+UKWgHkz0pc36jwEtL892bPUFzE+RyDw7gr3pom4C+zpd
 G0RxWOOgmVFVCMH2MZQc9XUvVWFKmaWRLTwQLKO7D5mCPlOJf311vHl54JwFaAC1LnRuKs6
 LjbTchmhsRjIVlnfyUNjQ==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:KO0D1B3WZbk=:dX6Zw5socH1Sw/yQEJ3FiP58
 3KC0hq9XuvWY9qKZRMsBKjusBZOq3tBWxtoqo01gy9moi6EnZuOnzhyANecjIJKjt8AVfDdhh
 KxjUekH3IvisxO/hne+aI7VXAt6VN3/Bg82YrWdnZ4VCPZxng0WW7qeU6H1sbfW7uM3EYy+K0
 OBr6Lq2iH+Ar68oWKLjHP6ISmdhgGRnAOHhsqH4qu0Vl9lqIH8n77jPEq1cpX0Kizlx+VubOT
 APuSiKnn73rsUXEsuFDyZ2AMiriMhyy8QqE0x/hbKjYiN6KHdvLhcbxCyc8ienlVmSVBMFxpP
 AwKM5AmRQVf9yh6wkIA2ThmjY1VJgivlITkm0jAORVfraEaayZi1RCDZOsqnz5FajvCdnP5dm
 n3n8Om2mYeeMG0GpOy/gqt/Sk0BJfgCEaXsWy37+trSuHsbdLzdXV8smCaZ8v3dD3JkvyVxzt
 0I22bkOJQNCNh0suxnTxg8yTTWj66c4lkIRgUCiIN3X2aKaWhChxSRuTS+OhiBHwtMqMoljoa
 LLhfd9FTATlZBkDL9PWwBvbpmTW8pYbLn1KTMVi1orCn36BkYsbuXDe3f1ACsf3BnTu5txLGv
 5Bm3xKYIxlKKQOPNfErOMnmtRHyoLCoCHP+VwSws3jDUSeB/CPAxZeQZWws5DxwQy7vCWweZU
 NBUhswwzbCA3kIuCERjb8JncAVh3kNyG34WqLvwYlkbkPSZ1qXkhWwS3UjJqeV6nvL7823o75
 VoOL2u/H5ry53JAmozC6RO2nvcxJApaulWNhFQ+2GkjHV6ubz0MAMaElJK1EPXmuJ7pyV39nR
 7AZx2SE1VILi+JY9cDLSjwnRjO8pRsD9RRkpFyT+ENcD8KeznoWHXfROgS3vktQFAB6vV+Ts2
 yXXEb3TzN/Z8maYr87Z3SPZtyhQ4J8IbgK5CbNTHtp2JEeXb8zq1/G4uVq97Ism9i9ZnP2LmZ
 PVJpx/J3tz14v+d3HsXBenM7gisYiGp8amOQY2aAgB3W+ISKYdCCqOdgVIXmM/Vnx2W/yFe/R
 4qRojuUJL/BGt+clh+o+jf8WHR4NVxx5KZ3LQ89JFxAmyhurNWIVqeOGxv7spxjXf2YZGqJAM
 0h+hNxpVBW5A9sA/Uv1KpLdpKWUE2YnIfbvh71c+UaF21Hgd8/LIa2w==


--=-1QMXBRzTcc5BlvukF/OW
Content-Type: multipart/alternative; boundary="=-92DsiSDVNQygDYo8DbyN"


--=-92DsiSDVNQygDYo8DbyN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thorsten!

Thank you for your quick response!

Now that you gave me the advice to check dmesg I found out that the
messages are the same with kernel version 5.16.10 and 5.16.12. But - as
I described - with kernel version 5.16.10 I had to press the power
button to resume from suspend. So I my conclusion that my laptop does
not go to suspend ist apparently wrong. In any case you find excerpts
from dmesg with both kernel versions attached.

Now there is one thing I really would like to understand. Concluding
from the time stamps in dmesg it seems that my laptop goes to suspend
only for a moment right before I re-open the lid. Of course I did not
close my laptop lid only for 3 seconds - as it could be concluded from
the time stamps for "PM: suspend entry (s2idle)" and "PM: suspend exit"
- but for a longer period of time. Can you please enlighten me about
that?


Thank you and best regards,

Reinhold

Am Mittwoch, dem 09.03.2022 um 07:51 +0100 schrieb Thorsten Leemhuis:
> Hi!
>
> On 08.03.22 19:21, Reinhold Mannsberger wrote:
> >
> > I am using Linux Mint Xfce 20.3 with kernel version 5.16. I had to use
> > kernel 5.16 because with the standard kernel version of Linux mit 20.3
> > (which is 5.13) my laptop did not correctly resume, when I closed the
> > lid.
> >
> > With kernel 5.16 my laptop perfectly went to to suspend when I closed
> > the lid and it perfectly resumed, when I opened the lid again. This
> > means: I had to press the power button once
>
> That sounds odd to me, as most modern Laptops wake up automatically when
> you open the lid. It's unlikely, but maybe that just that started to
> work now?
>
> > when I reopened the lid -
> > and then the laptop resumed (to the login screen). This was true until
> > kernel version 5.16.10. With kernel version > 5.16.10 my laptop does
> > not go into suspend anymore. This means: When I open the lid I am back
> > at the login screen immediately (I don't have to press the power butto=
n
> > anymore).
>
> You want to check dmesg if the system really didn't go to sleep; it will
> likely also provide a hint of what went wrong. Just upload the output
> (generated after a fresh start and where you suspend and resume once the
> system booted) somewhere and send us a link or sent it as an attachment
> in a reply. If that doesn't provide any hints of what might be wrong,
> you might need to find the change that introduced the problem using a
> bisection.
>
> HTH, Ciao, Thorsten
>
> > System information for my laptop:
> > ----------------------------------------------------------------------
> > System:    Kernel: 5.16.10-051610-generic x86_64 bits: 64 compiler: N/=
A
> > Desktop: Xfce 4.16.0
> >            tk: Gtk 3.24.20 wm: xfwm4 dm: LightDM Distro: Linux Mint
> > 20.3 Una
> >            base: Ubuntu 20.04 focal
> > Machine:   Type: Laptop System: HP product: HP ProBook 455 G8 Notebook
> > PC v: N/A serial: <filter>
> >            Chassis: type: 10 serial: <filter>
> >            Mobo: HP model: 8864 v: KBC Version 41.1E.00 serial:
> > <filter> UEFI: HP
> >            v: T78 Ver. 01.07.00 date: 10/08/2021
> > Battery:   ID-1: BAT0 charge: 43.8 Wh condition: 44.5/45.0 Wh (99%)
> > volts: 13.0/11.4
> >            model: Hewlett-Packard Primary serial: <filter> status:
> > Unknown
> > CPU:       Topology: 8-Core model: AMD Ryzen 7 5800U with Radeon
> > Graphics bits: 64 type: MT MCP
> >            arch: Zen 3 L2 cache: 4096 KiB
> >            flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a
> > ssse3 svm bogomips: 60685
> >            Speed: 3497 MHz min/max: 1600/1900 MHz Core speeds (MHz): 1=
:
> > 3474 2: 3464 3: 3473
> >            4: 3471 5: 4362 6: 4332 7: 3478 8: 3455 9: 3459 10: 3452 11=
:
> > 3462 12: 3468 13: 3468
> >            14: 3468 15: 3467 16: 3472
> > Graphics:  Device-1: AMD vendor: Hewlett-Packard driver: amdgpu v:
> > kernel bus ID: 05:00.0
> >            chip ID: 1002:1638
> >            Display: x11 server: X.Org 1.20.13 driver: amdgpu,ati
> > unloaded: fbdev,modesetting,vesa
> >            resolution: 1920x1080~60Hz
> >            OpenGL: renderer: AMD RENOIR (DRM 3.44.0 5.16.10-051610-
> > generic LLVM 12.0.0)
> >            v: 4.6 Mesa 21.2.6 direct render: Yes
> > ----------------------------------------------------------------------
> >
> >
> > Best regards,
> >
> > Reinhold Mannsberger
> >
> >
> >

--=-92DsiSDVNQygDYo8DbyN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align: left; direction: =
ltr; word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-whi=
te-space;"><div>Dear Thorsten!</div><div><br></div><div>Thank you for your =
quick response!</div><div><br></div><div>Now that you gave me the advice to=
 check dmesg I found out that the messages are the same with kernel version=
 5.16.10 and 5.16.12. But - as I described - with kernel version 5.16.10 I =
had to press the power button to resume from suspend. So I my conclusion th=
at my laptop does not go to suspend ist apparently wrong. In any case you f=
ind excerpts from dmesg with both kernel versions attached.</div><div><br><=
/div><div>Now there is one thing I really would like to understand. Conclud=
ing from the time stamps in dmesg it seems that my laptop goes to suspend o=
nly for a moment right before I re-open the lid. Of course I did not close =
my laptop lid only for 3 seconds - as it could be concluded from the time s=
tamps for "PM: suspend entry (s2idle)" and "PM: suspend exit" - but for a l=
onger period of time. Can you please enlighten me about that?</div><div><br=
></div><div><br></div><div>Thank you and best regards,</div><div><br></div>=
<div>Reinhold</div><div><br></div><div>Am Mittwoch, dem 09.03.2022 um 07:51=
 +0100 schrieb Thorsten Leemhuis:</div><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>Hi!<=
/pre><pre><br></pre><pre>On 08.03.22 19:21, Reinhold Mannsberger wrote:</pr=
e><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><pre><br></pre><pre>I am using Linux Mint Xfce=
 20.3 with kernel version 5.16. I had to use</pre><pre>kernel 5.16 because =
with the standard kernel version of Linux mit 20.3</pre><pre>(which is 5.13=
) my laptop did not correctly resume, when I closed the</pre><pre>lid.</pre=
><pre><br></pre><pre>With kernel 5.16 my laptop perfectly went to to suspen=
d when I closed</pre><pre>the lid and it perfectly resumed, when I opened t=
he lid again. This</pre><pre>means: I had to press the power button once</p=
re></blockquote><pre><br></pre><pre>That sounds odd to me, as most modern L=
aptops wake up automatically when</pre><pre>you open the lid. It's unlikely=
, but maybe that just that started to</pre><pre>work now?</pre><pre><br></p=
re><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><pre>when I reopened the lid -</pre><pre>and =
then the laptop resumed (to the login screen). This was true until</pre><pr=
e>kernel version 5.16.10. With kernel version &gt; 5.16.10 my laptop does</=
pre><pre>not go into suspend anymore. This means: When I open the lid I am =
back</pre><pre>at the login screen immediately (I don't have to press the p=
ower button</pre><pre>anymore).</pre></blockquote><pre><br></pre><pre>You w=
ant to check dmesg if the system really didn't go to sleep; it will</pre><p=
re>likely also provide a hint of what went wrong. Just upload the output</p=
re><pre>(generated after a fresh start and where you suspend and resume onc=
e the</pre><pre>system booted) somewhere and send us a link or sent it as a=
n attachment</pre><pre>in a reply. If that doesn't provide any hints of wha=
t might be wrong,</pre><pre>you might need to find the change that introduc=
ed the problem using a</pre><pre>bisection.</pre><pre><br></pre><pre>HTH, C=
iao, Thorsten</pre><pre><br></pre><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>System in=
formation for my laptop:</pre><pre>----------------------------------------=
------------------------------</pre><pre>System:    Kernel: 5.16.10-051610-=
generic x86_64 bits: 64 compiler: N/A</pre><pre>Desktop: Xfce 4.16.0</pre><=
pre>           tk: Gtk 3.24.20 wm: xfwm4 dm: LightDM Distro: Linux Mint</pr=
e><pre>20.3 Una</pre><pre>           base: Ubuntu 20.04 focal</pre><pre>Mac=
hine:   Type: Laptop System: HP product: HP ProBook 455 G8 Notebook</pre><p=
re>PC v: N/A serial: &lt;filter&gt;</pre><pre>           Chassis: type: 10 =
serial: &lt;filter&gt;</pre><pre>           Mobo: HP model: 8864 v: KBC Ver=
sion 41.1E.00 serial:</pre><pre>&lt;filter&gt; UEFI: HP</pre><pre>         =
  v: T78 Ver. 01.07.00 date: 10/08/2021</pre><pre>Battery:   ID-1: BAT0 cha=
rge: 43.8 Wh condition: 44.5/45.0 Wh (99%)</pre><pre>volts: 13.0/11.4</pre>=
<pre>           model: Hewlett-Packard Primary serial: &lt;filter&gt; statu=
s:</pre><pre>Unknown</pre><pre>CPU:       Topology: 8-Core model: AMD Ryzen=
 7 5800U with Radeon</pre><pre>Graphics bits: 64 type: MT MCP</pre><pre>   =
        arch: Zen 3 L2 cache: 4096 KiB</pre><pre>           flags: avx avx2=
 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a</pre><pre>ssse3 svm bogomips: =
60685</pre><pre>           Speed: 3497 MHz min/max: 1600/1900 MHz Core spee=
ds (MHz): 1:</pre><pre>3474 2: 3464 3: 3473</pre><pre>           4: 3471 5:=
 4362 6: 4332 7: 3478 8: 3455 9: 3459 10: 3452 11:</pre><pre>3462 12: 3468 =
13: 3468</pre><pre>           14: 3468 15: 3467 16: 3472</pre><pre>Graphics=
:  Device-1: AMD vendor: Hewlett-Packard driver: amdgpu v:</pre><pre>kernel=
 bus ID: 05:00.0</pre><pre>           chip ID: 1002:1638</pre><pre>        =
   Display: x11 server: X.Org 1.20.13 driver: amdgpu,ati</pre><pre>unloaded=
: fbdev,modesetting,vesa</pre><pre>           resolution: 1920x1080~60Hz</p=
re><pre>           OpenGL: renderer: AMD RENOIR (DRM 3.44.0 5.16.10-051610-=
</pre><pre>generic LLVM 12.0.0)</pre><pre>           v: 4.6 Mesa 21.2.6 dir=
ect render: Yes</pre><pre>-------------------------------------------------=
---------------------</pre><pre><br></pre><pre><br></pre><pre>Best regards,=
</pre><pre><br></pre><pre>Reinhold Mannsberger</pre><pre><br></pre><pre><br=
></pre><pre><br></pre></blockquote></blockquote>
</body></html>

--=-92DsiSDVNQygDYo8DbyN--

--=-1QMXBRzTcc5BlvukF/OW
Content-Disposition: attachment; filename="dmesg_kernel_5.16.10.txt"
Content-Type: text/plain; name="dmesg_kernel_5.16.10.txt"; charset="UTF-8"
Content-Transfer-Encoding: base64

WyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA1LjE2LjEwLTA1MTYxMC1nZW5lcmljIChidWls
ZGRAbGN5MDItYW1kNjQtMDMyKSAoZ2NjIChVYnVudHUgOS4zLjAtMTd1YnVudHUxfjIwLjA0KSA5
LjMuMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIFVidW50dSkgMi4zNCkgIzIwMjIwMjE4MTE1
NS1VYnVudHUgU01QIFBSRUVNUFQgRnJpIEZlYiAxOCAxMjowMzo1NCBVVEMgMjAyMgpbICAgIDAu
MDAwMDAwXSBDb21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9L2Jvb3Qvdm1saW51ei01LjE2LjEwLTA1
MTYxMC1nZW5lcmljIHJvb3Q9VVVJRD02MzYyYzIzMi1jMjg5LTRhZjQtYWY5Yy00MzA2Y2VlMjI1
ODkgcm8gcXVpZXQgc3BsYXNoClsgICAgMC4wMDAwMDBdIEtFUk5FTCBzdXBwb3J0ZWQgY3B1czoK
WyAgICAwLjAwMDAwMF0gICBJbnRlbCBHZW51aW5lSW50ZWwKWyAgICAwLjAwMDAwMF0gICBBTUQg
QXV0aGVudGljQU1EClsgICAgMC4wMDAwMDBdICAgSHlnb24gSHlnb25HZW51aW5lClsgICAgMC4w
MDAwMDBdICAgQ2VudGF1ciBDZW50YXVySGF1bHMKWyAgICAwLjAwMDAwMF0gICB6aGFveGluICAg
U2hhbmdoYWkgIApbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1
cmUgMHgwMDE6ICd4ODcgZmxvYXRpbmcgcG9pbnQgcmVnaXN0ZXJzJwpbICAgIDAuMDAwMDAwXSB4
ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDI6ICdTU0UgcmVnaXN0ZXJzJwpb
ICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDQ6ICdB
VlggcmVnaXN0ZXJzJwpbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZl
YXR1cmUgMHgyMDA6ICdQcm90ZWN0aW9uIEtleXMgVXNlciByZWdpc3RlcnMnClsgICAgMC4wMDAw
MDBdIHg4Ni9mcHU6IHhzdGF0ZV9vZmZzZXRbMl06ICA1NzYsIHhzdGF0ZV9zaXplc1syXTogIDI1
NgpbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiB4c3RhdGVfb2Zmc2V0WzldOiAgODMyLCB4c3RhdGVf
c2l6ZXNbOV06ICAgIDgKWyAgICAwLjAwMDAwMF0geDg2L2ZwdTogRW5hYmxlZCB4c3RhdGUgZmVh
dHVyZXMgMHgyMDcsIGNvbnRleHQgc2l6ZSBpcyA4NDAgYnl0ZXMsIHVzaW5nICdjb21wYWN0ZWQn
IGZvcm1hdC4KCi4uLgoKWyAgMTI4LjY4ODg4NF0gUE06IHN1c3BlbmQgZW50cnkgKHMyaWRsZSkK
WyAgMTI4LjY5MTMyMF0gRmlsZXN5c3RlbXMgc3luYzogMC4wMDIgc2Vjb25kcwpbICAxMzAuNzAz
Nzc3XSBCbHVldG9vdGg6IGhjaTA6IFRpbWVkIG91dCB3YWl0aW5nIGZvciBzdXNwZW5kIGV2ZW50
cwpbICAxMzAuNzAzNzg3XSBCbHVldG9vdGg6IGhjaTA6IFN1c3BlbmQgdGltZW91dCBiaXQ6IDkK
WyAgMTMwLjcwMzgxMl0gQmx1ZXRvb3RoOiBoY2kwOiBTdXNwZW5kIG5vdGlmaWVyIGFjdGlvbiAo
MykgZmFpbGVkOiAtMTEwClsgIDEzMC43MDM4MThdIEZyZWV6aW5nIHVzZXIgc3BhY2UgcHJvY2Vz
c2VzIC4uLiAoZWxhcHNlZCAwLjAwMiBzZWNvbmRzKSBkb25lLgpbICAxMzAuNzA1OTMwXSBPT00g
a2lsbGVyIGRpc2FibGVkLgpbICAxMzAuNzA1OTMwXSBGcmVlemluZyByZW1haW5pbmcgZnJlZXph
YmxlIHRhc2tzIC4uLiAoZWxhcHNlZCAwLjAwMSBzZWNvbmRzKSBkb25lLgpbICAxMzAuNzA3MDA3
XSBwcmludGs6IFN1c3BlbmRpbmcgY29uc29sZShzKSAodXNlIG5vX2NvbnNvbGVfc3VzcGVuZCB0
byBkZWJ1ZykKWyAgMTMxLjAyNTcwMV0gQUNQSTogRUM6IGludGVycnVwdCBibG9ja2VkClsgIDEz
MS4wOTY1NDFdIEFDUEk6IEVDOiBpbnRlcnJ1cHQgdW5ibG9ja2VkClsgIDEzMS4xMzgyNDJdIHBj
aSAwMDAwOjAwOjAwLjI6IGNhbid0IGRlcml2ZSByb3V0aW5nIGZvciBQQ0kgSU5UIEEKWyAgMTMx
LjEzODI0Nl0gcGNpIDAwMDA6MDA6MDAuMjogUENJIElOVCBBOiBubyBHU0kKWyAgMTMxLjEzOTkz
M10gW2RybV0gUENJRSBHQVJUIG9mIDEwMjRNIGVuYWJsZWQuClsgIDEzMS4xMzk5MzddIFtkcm1d
IFBUQiBsb2NhdGVkIGF0IDB4MDAwMDAwRjQwMDkwMDAwMApbICAxMzEuMTM5OTUzXSBhbWRncHUg
MDAwMDowNTowMC4wOiBhbWRncHU6IFNNVSBpcyByZXN1bWluZy4uLgpbICAxMzEuMTQyMTMxXSBh
bWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IGRwbSBoYXMgYmVlbiBkaXNhYmxlZApbICAxMzEu
MTQzMjQ2XSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IFNNVSBpcyByZXN1bWVkIHN1Y2Nl
c3NmdWxseSEKWyAgMTMxLjE0Mzg0MF0gW2RybV0gRE1VQiBoYXJkd2FyZSBpbml0aWFsaXplZDog
dmVyc2lvbj0weDAxMDEwMDBBClsgIDEzMS4xNDYxMTJdIG52bWUgbnZtZTA6IDE2LzAvMCBkZWZh
dWx0L3JlYWQvcG9sbCBxdWV1ZXMKWyAgMTMxLjIzNjg3M10gW2RybV0gVkNOIGRlY29kZSBhbmQg
ZW5jb2RlIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseSh1bmRlciBEUEcgTW9kZSkuClsgIDEzMS4y
MzczNTNdIFtkcm1dIEpQRUcgZGVjb2RlIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseS4KWyAgMTMx
LjIzNzM2NV0gYW1kZ3B1IDAwMDA6MDU6MDAuMDogYW1kZ3B1OiByaW5nIGdmeCB1c2VzIFZNIGlu
diBlbmcgMCBvbiBodWIgMApbICAxMzEuMjM3MzY5XSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRn
cHU6IHJpbmcgY29tcF8xLjAuMCB1c2VzIFZNIGludiBlbmcgMSBvbiBodWIgMApbICAxMzEuMjM3
MzcyXSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IHJpbmcgY29tcF8xLjEuMCB1c2VzIFZN
IGludiBlbmcgNCBvbiBodWIgMApbICAxMzEuMjM3Mzc0XSBhbWRncHUgMDAwMDowNTowMC4wOiBh
bWRncHU6IHJpbmcgY29tcF8xLjIuMCB1c2VzIFZNIGludiBlbmcgNSBvbiBodWIgMApbICAxMzEu
MjM3Mzc3XSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IHJpbmcgY29tcF8xLjMuMCB1c2Vz
IFZNIGludiBlbmcgNiBvbiBodWIgMApbICAxMzEuMjM3Mzc5XSBhbWRncHUgMDAwMDowNTowMC4w
OiBhbWRncHU6IHJpbmcgY29tcF8xLjAuMSB1c2VzIFZNIGludiBlbmcgNyBvbiBodWIgMApbICAx
MzEuMjM3MzgwXSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IHJpbmcgY29tcF8xLjEuMSB1
c2VzIFZNIGludiBlbmcgOCBvbiBodWIgMApbICAxMzEuMjM3MzgyXSBhbWRncHUgMDAwMDowNTow
MC4wOiBhbWRncHU6IHJpbmcgY29tcF8xLjIuMSB1c2VzIFZNIGludiBlbmcgOSBvbiBodWIgMApb
ICAxMzEuMjM3Mzg0XSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IHJpbmcgY29tcF8xLjMu
MSB1c2VzIFZNIGludiBlbmcgMTAgb24gaHViIDAKWyAgMTMxLjIzNzM4N10gYW1kZ3B1IDAwMDA6
MDU6MDAuMDogYW1kZ3B1OiByaW5nIGtpcV8yLjEuMCB1c2VzIFZNIGludiBlbmcgMTEgb24gaHVi
IDAKWyAgMTMxLjIzNzM4OF0gYW1kZ3B1IDAwMDA6MDU6MDAuMDogYW1kZ3B1OiByaW5nIHNkbWEw
IHVzZXMgVk0gaW52IGVuZyAwIG9uIGh1YiAxClsgIDEzMS4yMzczOTBdIGFtZGdwdSAwMDAwOjA1
OjAwLjA6IGFtZGdwdTogcmluZyB2Y25fZGVjIHVzZXMgVk0gaW52IGVuZyAxIG9uIGh1YiAxClsg
IDEzMS4yMzczOTFdIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdwdTogcmluZyB2Y25fZW5jMCB1
c2VzIFZNIGludiBlbmcgNCBvbiBodWIgMQpbICAxMzEuMjM3MzkzXSBhbWRncHUgMDAwMDowNTow
MC4wOiBhbWRncHU6IHJpbmcgdmNuX2VuYzEgdXNlcyBWTSBpbnYgZW5nIDUgb24gaHViIDEKWyAg
MTMxLjIzNzM5NF0gYW1kZ3B1IDAwMDA6MDU6MDAuMDogYW1kZ3B1OiByaW5nIGpwZWdfZGVjIHVz
ZXMgVk0gaW52IGVuZyA2IG9uIGh1YiAxClsgIDEzMS40NzM5MzFdIHVzYiAxLTM6IHJlc2V0IGZ1
bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4aGNpX2hjZApbICAxMzEuNjM4MzU1
XSBPT00ga2lsbGVyIGVuYWJsZWQuClsgIDEzMS42MzgzNTZdIFJlc3RhcnRpbmcgdGFza3MgLi4u
IApbICAxMzEuNjM5NTc3XSBCbHVldG9vdGg6IGhjaTA6IFJUTDogZXhhbWluaW5nIGhjaV92ZXI9
MGEgaGNpX3Jldj0wMDBjIGxtcF92ZXI9MGEgbG1wX3N1YnZlcj04ODIyClsgIDEzMS42NDAwNDNd
IGRvbmUuClsgIDEzMS42NDE1MTNdIEJsdWV0b290aDogaGNpMDogUlRMOiByb21fdmVyc2lvbiBz
dGF0dXM9MCB2ZXJzaW9uPTMKWyAgMTMxLjY0MTUyMF0gQmx1ZXRvb3RoOiBoY2kwOiBSVEw6IGxv
YWRpbmcgcnRsX2J0L3J0bDg4MjJjdV9mdy5iaW4KWyAgMTMxLjY0MTU3OV0gQmx1ZXRvb3RoOiBo
Y2kwOiBSVEw6IGxvYWRpbmcgcnRsX2J0L3J0bDg4MjJjdV9jb25maWcuYmluClsgIDEzMS42NDE2
MTNdIEJsdWV0b290aDogaGNpMDogUlRMOiBjZmdfc3ogNiwgdG90YWwgc3ogMzE0MjIKWyAgMTMx
LjY0MzAwNF0gUE06IHN1c3BlbmQgZXhpdAo=


--=-1QMXBRzTcc5BlvukF/OW
Content-Disposition: attachment; filename="dmesg_kernel_5.16.12.txt"
Content-Type: text/plain; name="dmesg_kernel_5.16.12.txt"; charset="UTF-8"
Content-Transfer-Encoding: base64

WyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA1LjE2LjEyLTA1MTYxMi1nZW5lcmljIChidWls
ZGRAbGN5MDItYW1kNjQtMDEyKSAoZ2NjIChVYnVudHUgOS4zLjAtMTd1YnVudHUxfjIwLjA0KSA5
LjMuMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIFVidW50dSkgMi4zNCkgIzIwMjIwMzAzMDkx
NS1VYnVudHUgU01QIFBSRUVNUFQgVGh1IE1hciAzIDA5OjIyOjIzIFVUQyAyMDIyClsgICAgMC4w
MDAwMDBdIENvbW1hbmQgbGluZTogQk9PVF9JTUFHRT0vYm9vdC92bWxpbnV6LTUuMTYuMTItMDUx
NjEyLWdlbmVyaWMgcm9vdD1VVUlEPTYzNjJjMjMyLWMyODktNGFmNC1hZjljLTQzMDZjZWUyMjU4
OSBybyBxdWlldCBzcGxhc2gKWyAgICAwLjAwMDAwMF0gS0VSTkVMIHN1cHBvcnRlZCBjcHVzOgpb
ICAgIDAuMDAwMDAwXSAgIEludGVsIEdlbnVpbmVJbnRlbApbICAgIDAuMDAwMDAwXSAgIEFNRCBB
dXRoZW50aWNBTUQKWyAgICAwLjAwMDAwMF0gICBIeWdvbiBIeWdvbkdlbnVpbmUKWyAgICAwLjAw
MDAwMF0gICBDZW50YXVyIENlbnRhdXJIYXVscwpbICAgIDAuMDAwMDAwXSAgIHpoYW94aW4gICBT
aGFuZ2hhaSAgClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVy
ZSAweDAwMTogJ3g4NyBmbG9hdGluZyBwb2ludCByZWdpc3RlcnMnClsgICAgMC4wMDAwMDBdIHg4
Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAwMjogJ1NTRSByZWdpc3RlcnMnClsg
ICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAwNDogJ0FW
WCByZWdpc3RlcnMnClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVh
dHVyZSAweDIwMDogJ1Byb3RlY3Rpb24gS2V5cyBVc2VyIHJlZ2lzdGVycycKWyAgICAwLjAwMDAw
MF0geDg2L2ZwdTogeHN0YXRlX29mZnNldFsyXTogIDU3NiwgeHN0YXRlX3NpemVzWzJdOiAgMjU2
ClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IHhzdGF0ZV9vZmZzZXRbOV06ICA4MzIsIHhzdGF0ZV9z
aXplc1s5XTogICAgOApbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBFbmFibGVkIHhzdGF0ZSBmZWF0
dXJlcyAweDIwNywgY29udGV4dCBzaXplIGlzIDg0MCBieXRlcywgdXNpbmcgJ2NvbXBhY3RlZCcg
Zm9ybWF0LgoKLi4uCgpbIDM5NTMuMzQyMTMyXSBQTTogc3VzcGVuZCBlbnRyeSAoczJpZGxlKQpb
IDM5NTMuMzQ1MTQwXSBGaWxlc3lzdGVtcyBzeW5jOiAwLjAwMyBzZWNvbmRzClsgMzk1NS4zNzUw
NThdIEJsdWV0b290aDogaGNpMDogVGltZWQgb3V0IHdhaXRpbmcgZm9yIHN1c3BlbmQgZXZlbnRz
ClsgMzk1NS4zNzUwNjldIEJsdWV0b290aDogaGNpMDogU3VzcGVuZCB0aW1lb3V0IGJpdDogOQpb
IDM5NTUuMzc1MDk1XSBCbHVldG9vdGg6IGhjaTA6IFN1c3BlbmQgbm90aWZpZXIgYWN0aW9uICgz
KSBmYWlsZWQ6IC0xMTAKWyAzOTU1LjM3NTEwMl0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNz
ZXMgLi4uIChlbGFwc2VkIDAuMDAyIHNlY29uZHMpIGRvbmUuClsgMzk1NS4zNzc3MzddIE9PTSBr
aWxsZXIgZGlzYWJsZWQuClsgMzk1NS4zNzc3MzhdIEZyZWV6aW5nIHJlbWFpbmluZyBmcmVlemFi
bGUgdGFza3MgLi4uIChlbGFwc2VkIDAuMDAxIHNlY29uZHMpIGRvbmUuClsgMzk1NS4zNzg4ODBd
IHByaW50azogU3VzcGVuZGluZyBjb25zb2xlKHMpICh1c2Ugbm9fY29uc29sZV9zdXNwZW5kIHRv
IGRlYnVnKQpbIDM5NTUuNTYzMjAxXSBBQ1BJOiBFQzogaW50ZXJydXB0IGJsb2NrZWQKWyAzOTU1
LjYzMjU2Ml0gQUNQSTogRUM6IGludGVycnVwdCB1bmJsb2NrZWQKWyAzOTU1LjY3NTAyN10gcGNp
IDAwMDA6MDA6MDAuMjogY2FuJ3QgZGVyaXZlIHJvdXRpbmcgZm9yIFBDSSBJTlQgQQpbIDM5NTUu
Njc1MDM0XSBwY2kgMDAwMDowMDowMC4yOiBQQ0kgSU5UIEE6IG5vIEdTSQpbIDM5NTUuNjc2NjU0
XSBbZHJtXSBQQ0lFIEdBUlQgb2YgMTAyNE0gZW5hYmxlZC4KWyAzOTU1LjY3NjY1N10gW2RybV0g
UFRCIGxvY2F0ZWQgYXQgMHgwMDAwMDBGNDAwOTAwMDAwClsgMzk1NS42NzY2NjddIGFtZGdwdSAw
MDAwOjA1OjAwLjA6IGFtZGdwdTogU01VIGlzIHJlc3VtaW5nLi4uClsgMzk1NS42NzgxMzVdIGFt
ZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdwdTogZHBtIGhhcyBiZWVuIGRpc2FibGVkClsgMzk1NS42
NzkzMDJdIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdwdTogU01VIGlzIHJlc3VtZWQgc3VjY2Vz
c2Z1bGx5IQpbIDM5NTUuNjc5ODk2XSBbZHJtXSBETVVCIGhhcmR3YXJlIGluaXRpYWxpemVkOiB2
ZXJzaW9uPTB4MDEwMTAwMEEKWyAzOTU1LjY4MzExOF0gbnZtZSBudm1lMDogMTYvMC8wIGRlZmF1
bHQvcmVhZC9wb2xsIHF1ZXVlcwpbIDM5NTUuNzcwOTQzXSBbZHJtXSBWQ04gZGVjb2RlIGFuZCBl
bmNvZGUgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5KHVuZGVyIERQRyBNb2RlKS4KWyAzOTU1Ljc3
MTQwMl0gW2RybV0gSlBFRyBkZWNvZGUgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5LgpbIDM5NTUu
NzcxNDE1XSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IHJpbmcgZ2Z4IHVzZXMgVk0gaW52
IGVuZyAwIG9uIGh1YiAwClsgMzk1NS43NzE0MjBdIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdw
dTogcmluZyBjb21wXzEuMC4wIHVzZXMgVk0gaW52IGVuZyAxIG9uIGh1YiAwClsgMzk1NS43NzE0
MjJdIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdwdTogcmluZyBjb21wXzEuMS4wIHVzZXMgVk0g
aW52IGVuZyA0IG9uIGh1YiAwClsgMzk1NS43NzE0MjNdIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFt
ZGdwdTogcmluZyBjb21wXzEuMi4wIHVzZXMgVk0gaW52IGVuZyA1IG9uIGh1YiAwClsgMzk1NS43
NzE0MjVdIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdwdTogcmluZyBjb21wXzEuMy4wIHVzZXMg
Vk0gaW52IGVuZyA2IG9uIGh1YiAwClsgMzk1NS43NzE0MjZdIGFtZGdwdSAwMDAwOjA1OjAwLjA6
IGFtZGdwdTogcmluZyBjb21wXzEuMC4xIHVzZXMgVk0gaW52IGVuZyA3IG9uIGh1YiAwClsgMzk1
NS43NzE0MjddIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdwdTogcmluZyBjb21wXzEuMS4xIHVz
ZXMgVk0gaW52IGVuZyA4IG9uIGh1YiAwClsgMzk1NS43NzE0MjldIGFtZGdwdSAwMDAwOjA1OjAw
LjA6IGFtZGdwdTogcmluZyBjb21wXzEuMi4xIHVzZXMgVk0gaW52IGVuZyA5IG9uIGh1YiAwClsg
Mzk1NS43NzE0MzBdIGFtZGdwdSAwMDAwOjA1OjAwLjA6IGFtZGdwdTogcmluZyBjb21wXzEuMy4x
IHVzZXMgVk0gaW52IGVuZyAxMCBvbiBodWIgMApbIDM5NTUuNzcxNDMyXSBhbWRncHUgMDAwMDow
NTowMC4wOiBhbWRncHU6IHJpbmcga2lxXzIuMS4wIHVzZXMgVk0gaW52IGVuZyAxMSBvbiBodWIg
MApbIDM5NTUuNzcxNDM0XSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IHJpbmcgc2RtYTAg
dXNlcyBWTSBpbnYgZW5nIDAgb24gaHViIDEKWyAzOTU1Ljc3MTQzNV0gYW1kZ3B1IDAwMDA6MDU6
MDAuMDogYW1kZ3B1OiByaW5nIHZjbl9kZWMgdXNlcyBWTSBpbnYgZW5nIDEgb24gaHViIDEKWyAz
OTU1Ljc3MTQzN10gYW1kZ3B1IDAwMDA6MDU6MDAuMDogYW1kZ3B1OiByaW5nIHZjbl9lbmMwIHVz
ZXMgVk0gaW52IGVuZyA0IG9uIGh1YiAxClsgMzk1NS43NzE0MzhdIGFtZGdwdSAwMDAwOjA1OjAw
LjA6IGFtZGdwdTogcmluZyB2Y25fZW5jMSB1c2VzIFZNIGludiBlbmcgNSBvbiBodWIgMQpbIDM5
NTUuNzcxNDM5XSBhbWRncHUgMDAwMDowNTowMC4wOiBhbWRncHU6IHJpbmcganBlZ19kZWMgdXNl
cyBWTSBpbnYgZW5nIDYgb24gaHViIDEKWyAzOTU2LjAxMzU4N10gdXNiIDEtMzogcmVzZXQgZnVs
bC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNkClsgMzk1Ni4xNzkwMTdd
IE9PTSBraWxsZXIgZW5hYmxlZC4KWyAzOTU2LjE3OTAyMF0gUmVzdGFydGluZyB0YXNrcyAuLi4g
ZG9uZS4KWyAzOTU2LjE4MjE3NV0gQmx1ZXRvb3RoOiBoY2kwOiBSVEw6IGV4YW1pbmluZyBoY2lf
dmVyPTBhIGhjaV9yZXY9MDAwYyBsbXBfdmVyPTBhIGxtcF9zdWJ2ZXI9ODgyMgpbIDM5NTYuMTg0
MTQ2XSBCbHVldG9vdGg6IGhjaTA6IFJUTDogcm9tX3ZlcnNpb24gc3RhdHVzPTAgdmVyc2lvbj0z
ClsgMzk1Ni4xODQxNTFdIEJsdWV0b290aDogaGNpMDogUlRMOiBsb2FkaW5nIHJ0bF9idC9ydGw4
ODIyY3VfZncuYmluClsgMzk1Ni4xODQxNjZdIEJsdWV0b290aDogaGNpMDogUlRMOiBsb2FkaW5n
IHJ0bF9idC9ydGw4ODIyY3VfY29uZmlnLmJpbgpbIDM5NTYuMTg0MTc3XSBCbHVldG9vdGg6IGhj
aTA6IFJUTDogY2ZnX3N6IDYsIHRvdGFsIHN6IDMxNDIyClsgMzk1Ni4xODQyOTZdIFBNOiBzdXNw
ZW5kIGV4aXQK


--=-1QMXBRzTcc5BlvukF/OW--

